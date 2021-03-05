require_relative '../support/active_record_connector'

class Project < ActiveRecord::Base
  has_many :project_tags
  has_many :tags, through: :project_tags
  has_many :entries

  validates :name, presence: true
  validates_uniqueness_of :name
end
