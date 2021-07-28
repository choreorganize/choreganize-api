FactoryBot.define do
  factory :mock_household, class: household do
    address { Faker::Address.street_address }
    housecode_digest { Faker::Internet.password }
  end
end
