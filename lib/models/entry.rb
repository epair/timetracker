require_relative '../support/active_record_connector'

class Entry < ActiveRecord::Base
  belongs_to :project
  has_many :entry_tags
  has_many :tags, through: :entry_tags

  validates_inclusion_of :on, in: [true, false]
  validates :project_id, presence: true

  def tags
    project_tags
  end
end
