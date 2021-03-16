require 'thor'
require 'pry'
require_relative '../models/project'
require_relative '../models/entry'
require_relative '../models/tag'

module Timetracker
  class CLI < Thor
    desc 'start PROJECT', 'Starts tracking work for given project'
    def start(project_name, *args)
      project = Project.find_or_create_by(name: project_name.to_s)
      entry = Entry.create(project: project, status: :start)
      tags = args.keep_if { |element| element.to_s.start_with?('@') }
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
      tag_names, details = args.partition { |element| element.to_s.start_with?('@') }
      project_name = details.first

      if project_name.nil?
        if tag_names.count == 1
          tag = Tag.find_by(name: tag_names)
          entry = Entry.create(status: :stop)
          EntryTag.create(tag: tag, entry: entry)
          puts "Stopping work on #{tag_names.first}, continuing work on #{tag.project.name}"
        else
          tags = Tag.where(name: tag_names)
          entry = Entry.create(status: :stop)
          tags.each do |tag|
            EntryTag.create(tag: tag, entry: entry)
          end
          puts "Stopping work on [#{tag_names.join(', ')}], continuing work on #{tags.first.project.name}"
        end
      else
        project = Project.find_by(name: project_name.to_s)
        Entry.create(project: project, status: :stop)
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
  end
end
