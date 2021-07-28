class Assignment < ApplicationRecord
  validates :completed, presence: true

  belongs_to :roommate
  belongs_to :chore
end
