FactoryBot.define do
  factory :mock_assignment, class: Assignment do
    completed { [true, false].sample }

    association :roommate, factory: :mock_roommate
    association :chore, factory: :mock_chore
  end
end
