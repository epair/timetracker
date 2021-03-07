require 'spec_helper'
require_relative '../../lib/models/tag'

RSpec.describe Tag, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:entry_tags) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '.create' do
    it 'creates a tag' do
      tag = FactoryBot.create(:tag)
      expect(tag).to be_valid
    end

    context 'with no project' do
      it 'rejects the tag' do
        tag = FactoryBot.build(:tag, project: nil)
        expect(tag).to be_invalid
      end
    end

    context 'with no name' do
      it 'rejects the tag' do
        tag = FactoryBot.build(:tag, name: nil)
        expect(tag).to be_invalid
      end
    end
  end
end
