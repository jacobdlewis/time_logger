class Project < ActiveRecord::Base
belongs_to :client

validates :client_id, :name, presence: true
validates :client_id, numericality: true
end
