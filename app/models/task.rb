class Task < ActiveRecord::Base
  attr_accessible :description, :priority

  validates_presence_of :description, :priority

  def self.all_by_priority
    find(:all, order: "priority desc, description asc")
  end
end
