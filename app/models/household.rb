class Household < ApplicationRecord
  validates :address, :housecode_digest, presence: true

  has_many :roommates
  has_many :chores
end
