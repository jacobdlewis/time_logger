class Project < ActiveRecord::Base
belongs_to :client
has_many :time_entries

validates :client_id, :name, presence: true
validates :client_id, numericality: true
end
