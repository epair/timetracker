require 'spec_helper'

RSpec.describe 'timetracker stop myproject', :type => :aruba do
  before { run_command('timetracker stop myproject') }
  context "ouputs message once tracking stops" do
    it { expect(last_command_started).to have_output('Stopping work on myproject') }
  end

  context "creates an entry for the project with on set to true" do
    let(:project) { Project.find_by(name: 'myproject')}

    it { expect(project.entries.where(status: :start).empty?).to be_falsey }
  end
end
