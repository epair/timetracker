require 'active_record'
require_relative 'entry_tag'

class Tag < ActiveRecord::Base
  belongs_to :project
  has_many :entry_tags
  has_many :entries, through: :entry_tags

  validates :name, presence: true
  validates :project_id, presence: true
end
