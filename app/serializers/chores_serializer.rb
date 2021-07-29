class ChoresSerializer
  include JSONAPI::Serializer
  attributes :task_name, :household_id, :description, :weight, :frequency, :outdoor
end
