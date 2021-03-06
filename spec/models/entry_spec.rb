require 'spec_helper'
require_relative '../../lib/models/entry'
require_relative '../../lib/models/tag'

RSpec.describe Entry do
  context 'is required to belong to a project and have a status' do
    it 'saves an entry with a valid project and status' do
      project = Project.create(name: 'timetracker')
      entry = Entry.new(project: project, status: :start)
      expect(entry.save).to be_truthy
    end

    it 'rejects an entry with no project' do
      entry = Entry.new(project: nil, status: :start)
      expect(entry.save).to be_falsey
    end

    it 'rejects an entry with no status update' do
      project = Project.create(name: 'timetracker')
      entry = Entry.new(project: project)
      expect(entry.save).to be_falsey
    end
  end

  it 'optionally contains notes' do
      project = Project.create(name: 'timetracker')
      entry = Entry.new(project: project, status: :start, notes: 'working on entry spec')

      expect(entry.save).to be_truthy
  end
end
