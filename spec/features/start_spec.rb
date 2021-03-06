require 'spec_helper'

RSpec.describe 'timetracker start myproject', :type => :aruba do
  before { run_command('timetracker start myproject @tag') }

  let(:project) { Project.find_by(name: 'myproject') }
  let(:tag) { Tag.find_by(name: '@tag') }
  let(:entry) { project.entries.last }

  it "ouputs success message" do
    expect(last_command_started).to have_output('Starting work on myproject')
  end

  it "creates an entry that starts time tracking" do
    expect(entry.status).to eq('start')
  end

  it "creates an entry tag" do
    expect(entry.tags).to include(tag)
  end
end
