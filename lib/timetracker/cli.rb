require 'thor'
module Timetracker
  class CLI < Thor
    desc "start PROJECT", "Starts tracking work for given project"
    def start(project)
      puts "Starting work on #{project}"
    end
  end
end
