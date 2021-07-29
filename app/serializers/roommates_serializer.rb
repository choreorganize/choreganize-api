class RoommatesSerializer
  include JSONAPI::Serializer
  attributes :household_id, :task_name, :description, :weight, :frequency, :outdoor
end
