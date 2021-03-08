require 'thor'
require_relative '../support/active_record_connector'
require_relative '../models/project'
require_relative '../models/entry'
require_relative '../models/tag'

module Timetracker
  class CLI < Thor
    desc 'start PROJECT', 'Starts tracking work for given project'
    def start(project_name, *args)
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../../db/test.sqlite3')

      project = Project.find_or_create_by(name: project_name.to_s)
      entry = Entry.create(project: project, status: :start)
      tags = args.keep_if { |element| element.to_s.start_with?('@') }
      tags.each do |name|
        tag = Tag.find_or_create_by(name: name, project: project)
        EntryTag.create(tag: tag, entry: entry)
      end
      puts "Starting work on #{project_name} [#{tags.join(', ')}] at #{entry.created_at.localtime.strftime('%I:%M%p')}"
    end

    desc 'stop PROJECT', 'Stops tracking work for given project'
    def stop(project_name)
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../../db/test.sqlite3')
      puts "Stopping work on #{project_name}"

      project = Project.find_by(name: project_name.to_s)
      Entry.create(project: project, status: :stop)
    end
  end
end
