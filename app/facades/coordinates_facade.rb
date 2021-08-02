class CoordinatesFacade 
  def self.coordinates(city, state)
    response = MapQuestService.get_coordinates(city, state)
    response[:results].first[:locations].first[:latLng]
  end
end