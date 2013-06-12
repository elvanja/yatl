class Task < ActiveRecord::Base
  belongs_to :user

  attr_accessible :description, :priority, :user_id

  validates_presence_of :description, :priority

  def self.all_by_priority
    find(:all, order: "priority desc, description asc")
  end
end
