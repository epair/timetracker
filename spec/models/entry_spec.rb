require 'spec_helper'
require_relative '../../lib/models/entry'
require_relative '../../lib/models/tag'
require_relative '../../lib/models/project_tag'

RSpec.describe Entry do
  context 'is required to belong to a project and have a status' do
    it 'saves an entry with a valid project and status' do
      project = Project.create(name: 'timetracker')
      entry = Entry.new(project: project, on: true)
      expect(entry.save).to be_truthy
    end

    it 'rejects an entry with no project' do
      entry = Entry.new(project: nil, on: true)
      expect(entry.save).to be_falsey
    end

    it 'rejects an entry with no status update' do
      project = Project.create(name: 'timetracker')
      entry = Entry.new(project: project)
      expect(entry.save).to be_falsey
    end
  end

  it 'optionally belongs_to a project_tag' do
      project = Project.create(name: 'timetracker')
      tag = Tag.create(name: 'testing')
      project_tag = ProjectTag.create(project: project, tag: tag)
      entry = Entry.new(project: project, on: true, project_tag: project_tag)

      expect(entry.save).to be_truthy
  end

  it 'optionally contains notes' do
      project = Project.create(name: 'timetracker')
      entry = Entry.new(project: project, on: true, notes: 'working on entry spec')

      expect(entry.save).to be_truthy
  end
end
