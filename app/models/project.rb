class Project < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :tasks, :order => :priority
  belongs_to :user
end
