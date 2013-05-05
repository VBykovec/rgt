class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :priority, :project_id, :status
  belongs_to :project
  acts_as_list :scope => :project
end
