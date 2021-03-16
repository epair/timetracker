require 'active_record'

class Entry < ActiveRecord::Base
  belongs_to :project
  has_many :entry_tags
  has_many :tags, through: :entry_tags

  enum status: %i[start stop notes]

  validates :status, presence: true
end
