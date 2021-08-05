class HouseholdSerializer
  include JSONAPI::Serializer
  set_type :households
  attributes :id :address, :city, :state, :roommates, :chores, :weather_forecast
end
