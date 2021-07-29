FactoryBot.define do
  factory :mock_roommate, class: Roommate do
    name { Faker::FunnyName.name }
    email { Faker::Internet.email }
    google_id { Faker::Internet.password }
    token { Faker::Internet.password }
    
    association :household, factory: :mock_household
  end
end
