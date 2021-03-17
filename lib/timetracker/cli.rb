require 'thor'
require 'csv'
require 'pry'
require_relative '../models/project'
require_relative '../models/entry'
require_relative '../models/tag'

module Timetracker
  class CLI < Thor
    desc 'start PROJECT', 'Starts tracking work for given project'
    def start(project_name, *args)
      project = Project.find_or_create_by(name: project_name.to_s)
      tags, notes = args.partition { |element| element.to_s.start_with?('@') }
      entry = Entry.create(project: project, status: :start, notes: notes.join(" "))
      tags.each do |name|
        tag = Tag.find_or_create_by(name: name, project: project)
        EntryTag.create(tag: tag, entry: entry)
      end
      if tags.empty?
        puts "Starting work on #{project_name} at #{entry.created_at.localtime.strftime('%I:%M%p')}"
      else
        puts "Starting work on #{project_name} [#{tags.join(', ')}] at #{entry.created_at.localtime.strftime('%I:%M%p')}"
      end
    end

    desc 'stop PROJECT', 'Stops tracking work for given project'
    def stop(*args)
      if args.first.start_with?('@')
        tag_names, notes = args.partition { |element| element.to_s.start_with?('@') }
        if tag_names.count == 1
          tag = Tag.find_by(name: tag_names)
          entry = Entry.create(status: :stop, notes: notes.join(' '))
          EntryTag.create(tag: tag, entry: entry)
          puts "Stopping work on #{tag_names.first}, continuing work on #{tag.project.name}"
        else
          tags = Tag.where(name: tag_names)
          entry = Entry.create(status: :stop,  notes: notes.join(' '))
          tags.each do |tag|
            EntryTag.create(tag: tag, entry: entry)
          end
          puts "Stopping work on [#{tag_names.join(', ')}], continuing work on #{tags.first.project.name}"
        end
      else
        project_name = args.shift
        tag_names, notes = args.partition { |element| element.to_s.start_with?('@') }
        project = Project.find_by(name: project_name.to_s)
        Entry.create(project: project, status: :stop, notes: notes.join(' '))
        puts "Stopping work on #{project_name}"
      end
    end

    desc 'projects', 'Lists all projects'
    def projects
      projects = Project.all.map(&:name)
      puts projects.join('\n')
    end

    desc 'tags', 'Lists all tags'
    def tags
      tags = Tag.all.map(&:name).uniq
      puts tags.join('\n')
    end

    desc 'export', 'Exports data as csv'
    def export
      puts 'Exporting data as CSV'
      CSV.open("timetracker_data.csv", "wb") do |csv|
        csv << ['created_at', 'status', 'project', 'tags', 'notes']
        Entry.find_each do |entry|
          csv << [entry.created_at, entry.status, entry.project.name, entry.tags.map(&:name).join(", "), entry.notes]
        end
      end
    end
  end
end
