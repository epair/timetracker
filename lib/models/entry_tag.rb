require 'active_record'

class EntryTag < ActiveRecord::Base
  belongs_to :entry
  belongs_to :tag
end
