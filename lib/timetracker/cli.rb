require 'thor'
require_relative '../support/active_record_connector'
require_relative '../models/project'
require_relative '../models/entry'

module Timetracker
  class CLI < Thor
    desc "start PROJECT", "Starts tracking work for given project"
    def start(project_name)
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../../db/test.sqlite3')
      puts "Starting work on #{project_name}"

      project = Project.find_or_create_by(name: "#{project_name}")
      Entry.create(project: project, on: true)
    end

    desc "stop PROJECT", "Stops tracking work for given project"
    def stop(project_name)
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../../db/test.sqlite3')
      puts "Stopping work on #{project_name}"

      project = Project.find_by(name: "#{project_name}")
      Entry.create(project: project, on: false)
    end
  end
end
