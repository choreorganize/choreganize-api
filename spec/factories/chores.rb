FactoryBot.define do
  factory :mock_chore, class: Chore do
    # task_name { Faker::Hobby.activity  }
    task_name { Faker::Lorem.word  }
    description { Faker::Hipster.paragraph }
    weight { [1,2,3].sample }
    frequency { [1,2,3].sample }
    outdoor { [true,false].sample }

    association :household, factory: :mock_household
  end
end
