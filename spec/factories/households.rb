FactoryBot.define do
  factory :mock_household, class: Household do
    address { Faker::Address.street_address }
    city { "denver" }
    state { "co" }
    password_digest { Faker::Internet.password }
  end
end
