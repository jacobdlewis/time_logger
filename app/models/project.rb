class Project < ActiveRecord::Base
belongs_to :category
belongs_to :client
has_many :time_entries

validates :client_id, :name, :category_id, presence: true
validates :client_id, :category_id, numericality: true
end
