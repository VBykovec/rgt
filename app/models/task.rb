class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :priority, :project_id, :status
  belongs_to :project
  validates :description, :project_id, presence: true
  acts_as_list :scope => :project
end
