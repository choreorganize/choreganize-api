class RoommateSerializer 
  include JSONAPI::Serializer
  attributes :name, :email, :google_id, :token, :household, :incomplete_chores, :completed_chores
  set_type :google_user
  # routes to household serializer
  belongs_to :household
  #routes to assignment serializer
  has_many :assignments

end
