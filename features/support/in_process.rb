require_relative '../../lib/timetracker/runner'

Before('@in-process') do
  aruba.config.command_launcher = :in_process
  aruba.config.main_class = Timetracker::Runner
  Timecop.freeze(Time.local(2020, 1, 2, 10, 4, 0).utc)
end

After('@in-process') do
  aruba.config.command_launcher = :spawn
  Timecop.return
end
