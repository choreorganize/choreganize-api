class Household < ApplicationRecord
  validates :address, :city, :state, :password_digest, presence: true

  has_many :roommates
  has_many :chores

  has_secure_password

  # is this violating a design pattern?
  def weather_forecast 
    city = self.city
    state = self.state
    ForecastFacade.forecast(city, state)
  end
end
