FactoryBot.define do
  factory :chore do
    household { nil }
    task_name { "MyString" }
    description { "MyText" }
    weight { 1 }
    frequency { 1 }
    outdoor { false }
  end
end
