require 'spec_helper'

RSpec.describe 'timetracker stop myproject', :type => :aruba do
  context "ouputs message once tracking stops" do
    before { run_command('timetracker stop myproject') }
    it { expect(last_command_started).to have_output('Stopping work on myproject') }
  end


  context "creates an entry for the project with on set to true" do
    before do
      run_command('timetracker start myproject')
      run_command('timetracker stop myproject')
    end
    let(:project) { Project.find_by(name: 'myproject')}
    it { expect(project.entries.last).to be_an_instance_of(Entry) }
    it { expect(project.entries.last.on).to be_falsey }
  end
end
