class Chore < ApplicationRecord
  validates :task_name, :description, :outdoor, presence: true
  validates :weight, presence: true, numericality: true
  validates :frequency, presence: true
  enum frequency: {weekly: 1, bimonthly: 2, monthly: 3} 

  belongs_to :household
  has_many :assignments, dependent: :destroy 
  has_many :roommates, through: :assignments, dependent: :destroy 
end
