require 'spec_helper'
require_relative '../../lib/models/entry'
require_relative '../../lib/models/tag'

RSpec.describe Entry, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:entry_tags) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:project_id) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
