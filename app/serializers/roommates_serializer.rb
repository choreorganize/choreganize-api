class RoommatesSerializer
  include JSONAPI::Serializer
  attributes :name, :household_id, :email, :google_id, :token
end
