# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Household.destroy_all
Roommate.destroy_all
Chore.destroy_all
Assignment.destroy_all 

20.times do
  Household.create do |household|
    household.address = Faker::Address.street_address
    household.city = "denver"
    household.state = "co"
    household.password_digest = Faker::Internet.password
  end
end

 chore_1 = Chore.create!(task_name: Faker::Lorem.word, description: Faker::Hipster.paragraph, weight: [1,2,3].sample, frequency: [1,2,3].sample, outdoor: true, household: Household.all.first)
 chore_2 = Chore.create!(task_name: Faker::Lorem.word, description: Faker::Hipster.paragraph, weight: [1,2,3].sample, frequency: [1,2,3].sample, outdoor: true, household: Household.all.first)
 chore_3 = Chore.create!(task_name: Faker::Lorem.word, description: Faker::Hipster.paragraph, weight: [1,2,3].sample, frequency: [1,2,3].sample, outdoor: true, household: Household.all.first)
 chore_4 = Chore.create!(task_name: Faker::Lorem.word, description: Faker::Hipster.paragraph, weight: [1,2,3].sample, frequency: [1,2,3].sample, outdoor: true, household: Household.all.first)
 chore_5 = Chore.create!(task_name: Faker::Lorem.word, description: Faker::Hipster.paragraph, weight: [1,2,3].sample, frequency: [1,2,3].sample, outdoor: true, household: Household.all.first)
 chore_6 = Chore.create!(task_name: Faker::Lorem.word, description: Faker::Hipster.paragraph, weight: [1,2,3].sample, frequency: [1,2,3].sample, outdoor: true, household: Household.all.first)

 roommate_1 = Roommate.create!(name: Faker::FunnyName.name, email: Faker::Internet.email, google_id: Faker::Internet.password, token: Faker::Internet.password, household: Household.all.first)
 roommate_2 = Roommate.create!(name: Faker::FunnyName.name, email: Faker::Internet.email, google_id: Faker::Internet.password, token: Faker::Internet.password, household: Household.all.first)
 roommate_3 = Roommate.create!(name: Faker::FunnyName.name, email: Faker::Internet.email, google_id: Faker::Internet.password, token: Faker::Internet.password, household: Household.all.first)

  Assignment.create!(completed: true, chore: chore_1, roommate: roommate_1)
  Assignment.create!(completed: false, chore: chore_2, roommate: roommate_1)
  Assignment.create!(completed: true, chore: chore_3, roommate: roommate_2)
  Assignment.create!(completed: false, chore: chore_4, roommate: roommate_2)
  Assignment.create!(completed: true, chore: chore_5, roommate: roommate_3)
  Assignment.create!(completed: false, chore: chore_6, roommate: roommate_3)

