require 'spec_helper'
require_relative '../../lib/models/project'
require_relative '../../lib/models/tag'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tags) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe '.create' do
    context 'with a unique valid name' do
      it 'creates a project' do
        project = FactoryBot.build(:project)
        expect(project).to be_valid
      end
    end

    context 'with no name' do
      it 'rejects a project' do
        project = FactoryBot.build(:project, name: nil)
        expect(project).to be_invalid
      end
    end

    context 'with an empty string name' do
      it 'rejects a project' do
        project = FactoryBot.build(:project, name: '')
        expect(project).to be_invalid
      end
    end
  end
end
