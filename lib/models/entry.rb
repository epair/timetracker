require 'active_record'

class Entry < ActiveRecord::Base
  belongs_to :project
  belongs_to :project_tag
  validates :on, presence: true
  validates :project_id, presence: true
end
