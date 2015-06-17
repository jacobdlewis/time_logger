class Category < ActiveRecord::Base

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :name, numericality: false
  validates :name, uniqueness: true
  validates :name, format: { without: /[@!$%&*]/, message: "Category name cannot contain any of these characters - @!$%&*" }

end
