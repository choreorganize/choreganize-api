class Household < ApplicationRecord
  validates :address, :city, :state, :password_digest, presence: true

  has_many :roommates
  has_many :chores

  has_secure_password
end
