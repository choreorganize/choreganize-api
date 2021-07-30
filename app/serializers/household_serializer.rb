class HouseholdSerializer
  include JSONAPI::Serializer
  set_type :households
  attributes :address, :city, :state, :roommates, :chores
end
