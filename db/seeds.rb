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

20.times do
  Household.create do |household|
    household.address = Faker::Address.street_address
    household.city = "denver"
    household.state = "co"
    household.housecode_digest = Faker::Internet.password
    3.times do
      household.roommates.new do |roommate|
        roommate.name = Faker::FunnyName.name
        roommate.email = Faker::Internet.email
        roommate.google_id = Faker::Internet.password
        roommate.token = Faker::Internet.password
      end
    end
    9.times do
      household.chores.new do |chore|
        # chore.task_name = Faker::Hobby.activity 
        chore.task_name = Faker::Lorem.word
        chore.description = Faker::Hipster.paragraph
        chore.weight = [1,2,3].sample
        chore.frequency = [1,2,3].sample
        chore.outdoor = [true,false].sample
      end
    end
  end
end
