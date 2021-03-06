require 'spec_helper'
require_relative '../../lib/models/entry'
require_relative '../../lib/models/tag'

RSpec.describe Entry do
  describe '.create' do
    it 'creates an entry' do
      entry = FactoryBot.create(:entry, :start)
      expect(entry).to be_valid
    end

    context 'with no project' do
      it 'rejects an entry' do
        entry = FactoryBot.build(:entry, :start, project: nil)
        expect(entry).to be_invalid
      end
    end

    context 'with no status' do
      it 'rejects an entry' do
        entry = FactoryBot.build(:entry)
        expect(entry).to be_invalid
      end
    end

    it 'optionally contains notes' do
      entry = FactoryBot.create(:entry, :start, notes: 'some notes')
      expect(entry).to be_valid
    end
  end
end
