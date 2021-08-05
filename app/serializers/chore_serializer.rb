class ChoreSerializer
  include JSONAPI::Serializer
  attributes :id, :task_name, :household_id, :description, :weight, :frequency, :outdoor, :household
  belongs_to :household
end
