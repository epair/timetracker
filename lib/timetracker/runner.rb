require_relative 'cli'

module Timetracker
  class Runner
    def initialize(argv, stdin, stdout, stderr, kernel)
      @argv   = argv
      $kernel = kernel
      $stdin  = stdin
      $stdout = stdout
      $stderr = stderr
    end

    def execute!
      Timetracker::CLI.start @argv
    end
  end
end
