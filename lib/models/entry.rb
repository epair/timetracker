require_relative '../support/active_record_connector'

class Entry < ActiveRecord::Base
  belongs_to :project
  belongs_to :project_tag
  validates :on, presence: true
  validates :project_id, presence: true
end
