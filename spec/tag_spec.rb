require 'spec_helper'
require_relative '../lib/models/tag'
require_relative '../lib/models/project_tag'

RSpec.describe Tag do
  context 'has a required name field' do
    it 'saves a tag with a valid name' do
      tag = Tag.new(name: 'name')
      expect(tag.save).to be_truthy
    end

    it 'rejects a tag with no name' do
      tag = Tag.new(name: nil)
      expect(tag.save).to be_falsey
    end

    it 'rejects a tag with an empty string name' do
      tag = Tag.new(name: '')
      expect(tag.save).to be_falsey
    end
  end

  context 'has_many projects through project_tags' do
    it 'returns an array of projects' do
      tag = Tag.create(name: 'testing')
      project = Project.create(name: 'timetracker')
      project_tag = ProjectTag.create(project: project, tag: tag)

      expect(tag.projects.first).to eq(project)
    end
  end
end
