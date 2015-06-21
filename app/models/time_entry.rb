class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :client
  validates :date, :client_id, :category_id, :comment, :area,
            :business_mileage, :personal_mileage, :hours_worked,
            presence: true
  validates :client_id, :category_id, :business_mileage,
            :personal_mileage, :hours_worked, numericality: true
end
