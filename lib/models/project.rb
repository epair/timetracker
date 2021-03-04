require 'active_record'

class Project < ActiveRecord::Base
  validates :name, presence: true
  has_many :project_tags
  has_many :tags, through: :project_tags
end
