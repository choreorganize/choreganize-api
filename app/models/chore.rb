class Chore < ApplicationRecord
  validates :task_name, :description, :outdoor, presence: true
  validates :weight, presence: true, numericality: true
  validates :frequency, presence: true, numericality: true

  belongs_to :household
  has_many :assignments
  has_many :roommates, through: :assignments
end
