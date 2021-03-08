require 'spec_helper'
require_relative '../../lib/models/project'
require_relative '../../lib/models/tag'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tags) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:project) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
