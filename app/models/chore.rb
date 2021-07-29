class Chore < ApplicationRecord
  validates :task_name, :description, :outdoor, presence: true
  validates :weight, :frequency, presence: true, numericality: true
  enum frequency: {weekly: 0, bimonthly: 1, monthly: 2}
  # enum frequency: [:weekly, :bimonthly, :monthly]


  belongs_to :household
  has_many :assignments
  has_many :roommates, through: :assignments
end
