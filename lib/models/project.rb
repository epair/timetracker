require 'active_record'

class Project < ActiveRecord::Base
  validates :name, presence: true
end
