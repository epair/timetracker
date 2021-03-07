require 'spec_helper'
require_relative '../../lib/models/entry_tag'

RSpec.describe EntryTag, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:entry) }
    it { is_expected.to belong_to(:tag) }
  end
end
