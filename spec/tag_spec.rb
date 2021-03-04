require 'spec_helper'
require_relative '../lib/models/tag'

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
end
