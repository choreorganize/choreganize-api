class AssignmentSerializer
  include JSONAPI::Serializer
  belongs_to :chore
  belongs_to :roommate
end
