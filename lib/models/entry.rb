require_relative '../support/active_record_connector'

class Entry < ActiveRecord::Base
  belongs_to :project
  belongs_to :project_tag
  validates_inclusion_of :on, in: [true, false]
  validates :project_id, presence: true
end
