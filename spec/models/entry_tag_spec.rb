require 'spec_helper'
require_relative '../../lib/models/entry_tag'

RSpec.describe EntryTag, type: :model do
  describe 'associations' do
    it { should belong_to(:entry) }
    it { should belong_to(:tag) }
  end
end
