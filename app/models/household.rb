class Household < ApplicationRecord
  validates :address, :city, :state, :housecode_digest, presence: true

  has_many :roommates
  has_many :chores
end
