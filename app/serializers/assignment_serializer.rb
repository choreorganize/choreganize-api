class AssignmentSerializer
  include JSONAPI::Serializer
  attributes :completed, :roommate_id, :chore_id
  belongs_to :chore
  belongs_to :roommate
end
