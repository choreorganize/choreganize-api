class Roommate < ApplicationRecord
  validates :user_id, presence: true
  
  belongs_to :household
  has_many :assignments
  has_many :chores, through: :assignments
end
