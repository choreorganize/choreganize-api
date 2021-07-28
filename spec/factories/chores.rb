FactoryBot.define do
  factory :mock_chore, class: Chore do
    household { nil }
    task_name { Faker::Hobby.activity  }
    description { Faker::Hipster.paragraph }
    weight { [1,2,3].sample }
    frequency { [1,2,3].sample }
    outdoor { [true,false].sample }
  end
end
