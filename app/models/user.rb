class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :time_entries, dependent: :destroy
  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]

  validates :email, :name, :username, presence: true
  validates :name, length: { minimum: 3 }
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }, uniqueness: true
  validates :username, length: { minimum: 3 }
  validates :username, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: { on: :create }
end
