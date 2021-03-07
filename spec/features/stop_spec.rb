require 'spec_helper'

RSpec.describe 'timetracker stop myproject', type: :aruba do
  before { run_command('timetracker stop myproject') }

  let(:project) { Project.find_by(name: 'myproject') }
  let(:entry) { Entry.last }

  it 'ouputs success message' do
    expect(last_command_started).to have_output('Stopping work on myproject')
  end

  it 'creates an entry with the status stop' do
    expect(project.entries.where(status: :stop).last).to eq(entry)
  end
end
