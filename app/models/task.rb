class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :priority, :project_id, :status
end
