class Chore < ApplicationRecord
  validates :task_name, :description, :outdoor, presence: true
  validates :weight, :frequency, presence: true, numericality: true
  # enum frequency: {1: "weekly", 2: "bimonthly", 3: "monthly"}
  enum frequency: {weekly: 1, bimonthly: 2, monthly: 3}
  # enum frequency: [:weekly, :bimonthly, :monthly]

  belongs_to :household
  has_many :assignments
  has_many :roommates, through: :assignments
end
