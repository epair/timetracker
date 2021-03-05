require 'thor'
require_relative '../support/active_record_connector'
require_relative '../models/project'
require_relative '../models/entry'

module Timetracker
  class CLI < Thor
    desc "start PROJECT", "Starts tracking work for given project"
    def start(project_name)
      puts "Starting work on #{project_name}"

      project = Project.create(name: "#{project_name}")
      Entry.create(project: project, on: true)
    end
  end
end
