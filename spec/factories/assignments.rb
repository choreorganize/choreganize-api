FactoryBot.define do
  factory :assignment do
    completed { false }
    roommate { nil }
    chore { nil }
  end
end
