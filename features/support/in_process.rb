require_relative '../../lib/timetracker/runner'

Before('@in-process') do
  aruba.config.command_launcher = :in_process
  aruba.config.main_class = Timetracker::Runner
end

After('@in-process') do
  aruba.config.command_launcher = :spawn
end
