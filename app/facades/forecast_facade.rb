class ForecastFacade 
  def self.forecast(city, state)
    coordinates = CoordinatesFacade.coordinates(city, state)
    data = OpenWeatherService.get_forecast_data(coordinates)
    ForecastDetails.new(data)
  end
end