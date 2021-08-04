class Household < ApplicationRecord
  validates :address, :city, :state, :password_digest, presence: true

  has_many :roommates, dependent: :destroy 
  has_many :chores, dependent: :destroy 

  has_secure_password

  # is this violating a design pattern?
  def weather_forecast 
    city = self.city
    state = self.state
    ForecastFacade.forecast(city, state)
  end
end
