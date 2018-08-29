class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  belongs_to :project
  has_one :client, through: :project
  has_one :category, through: :project

  validates :date, :project_id, :activity_id, :business_mileage, :personal_mileage, :hours_worked,
            presence: true
  validates :project_id, :activity_id, :business_mileage,
            :personal_mileage, :hours_worked, numericality: true
  validates :project_id, :numericality => {:allow_blank => true}

  scope :last_month, -> { where(:date => Date.today.beginning_of_month..Date.today.end_of_month) }
  scope :last_year, -> { where(:date => Date.today.beginning_of_year..Date.today.end_of_year) }
  scope :last_week, -> { where(:date => Date.today.beginning_of_week..Date.today.end_of_week) }
end
