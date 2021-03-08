require 'active_record'

class Project < ActiveRecord::Base
  has_many :tags
  has_many :entries

  validates :name, presence: true
  validates_uniqueness_of :name
end
