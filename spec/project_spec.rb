require 'spec_helper'
require_relative '../lib/models/project'

RSpec.describe Project do
  context 'has a required name field' do
    it 'saves a project with a valid name' do
      project = Project.new(name: 'name')
      expect(project.save).to be_truthy
    end

    it 'rejects a project with no name' do
      project = Project.new(name: nil)
      expect(project.save).to be_falsey
    end

    it 'rejects a project with an empty string name' do
      project = Project.new(name: '')
      expect(project.save).to be_falsey
    end
  end
end
