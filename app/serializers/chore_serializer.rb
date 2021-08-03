class ChoreSerializer
  include JSONAPI::Serializer
  attributes :task_name, :household_id, :description, :weight, :frequency, :outdoor, :household
  belongs_to :household
end
