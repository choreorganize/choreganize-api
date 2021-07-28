FactoryBot.define do
  factory :assignment, class: Assignment do
    completed { [true, false].sample }
    roommate { nil }
    chore { nil }
  end
end
