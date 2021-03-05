require 'spec_helper'

RSpec.describe 'timetracker start myproject', :type => :aruba do
  before { run_command('timetracker start myproject') }

  it "ouputs start message once tracking starts" do
    expect(last_command_started).to have_output('Starting work on myproject')
  end

  it "creates an entry for the project with on set to true" do
    project = Project.find_by(name: 'myproject')
    expect(project.entries.last).to be_an_instance_of(Entry)
    expect(project.entries.last.on).to be_truthy
  end
end
