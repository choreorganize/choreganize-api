FactoryBot.define do
  factory :mock_chore, class: Chore do
    # task_name { Faker::Hobby.activity  }
    task_name { Faker::Lorem.word  }
    description { Faker::Hipster.paragraph }
    weight { [1,2,3].sample }
    # frequency { [0,1,2].sample }
    frequency { Chore.frequencies.values.sample }
    traits_for_enum(:frequency, { weekly: 1, bimonthly: 2, monthly: 3 })
    # traits_for_enum(:frequency, { 1: "weekly", 2: "bimonthly", 3: "monthly" })
    # traits_for_enum(:frequency, { queued: 0, started: 1, finished: 2 })
    # frequency { [1,2,3].sample }
    outdoor { true }
    # outdoor { [true,false].sample }

    association :household, factory: :mock_household
  end
end
