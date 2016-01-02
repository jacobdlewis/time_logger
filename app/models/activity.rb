class Activity < ActiveRecord::Base
  has_many :time_entries

  validates_presence_of :name
end
