class Roommate < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :google_id, presence: true
  validates :token, presence: true 
  
  belongs_to :household
  has_many :assignments
  has_many :chores, through: :assignments
end
