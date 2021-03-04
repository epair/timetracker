require 'active_record'

class ProjectTag < ActiveRecord::Base
  belongs_to :project
  belongs_to :tag
end
