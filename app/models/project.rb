class Project < ActiveRecord::Base
  attr_accessible :name, :user_id
  default_scope :order => :id
  has_many :tasks, :order => :position, :dependent => :destroy
  def as_json(options = {})
    super(include: [:tasks])
  end
  validates :name, :user_id, presence: true
  belongs_to :user
end
