FactoryBot.define do
  factory :assignment do
    completed { [true, false].sample }
    roommate { nil }
    chore { nil }
  end
end
