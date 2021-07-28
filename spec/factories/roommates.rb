FactoryBot.define do
  factory :roommate, class: Roommate do
    user_id { nil }
    household { nil }
  end
end
