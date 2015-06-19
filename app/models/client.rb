class Client < ActiveRecord::Base

  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :first_name, :last_name, format: { without: /\d/, message: "Client name cannot contain number characters."}
  validates :first_name, :last_name, format: { without: /[@!$%&*]/, message: "Client name cannot contain any of these characters - @!$%&*"}

end