class Category < ActiveRecord::Base
  has_many :time_entries
  has_many :projects
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :name, numericality: false
  validates :name, uniqueness: true
  validates :name, format: { without: /[@!$%&*]/, message: "Category name cannot contain any of these characters - @!$%&*" }

end
