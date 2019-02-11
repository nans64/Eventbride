# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

15.times do
  mdp = Faker::Internet.password(8)
  user = User.create!(email: Faker::Internet.email, encrypted_password: mdp, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::SiliconValley.quote)
  puts ""
  puts "user #{user.first_name} #{user.last_name}"
  sleep(0.05)
  puts "#{user.description}"
  puts ""
  puts "~~~~~~~~~~~~~~~~~~~next~~~~~~~~~~~~~~~~>"
end

10.times do
  e=Event.create(start_date: DateTime.new(2019,rand(6..12),rand(1..28)), duration:[10,15,20,25,30,35,40,45,75,125].sample , title:Faker::ChuckNorris.fact , description:Faker::TvShows::HowIMetYourMother.quote , price: rand(1..1000) , location:Faker::WorldCup.city , user_id: User.last)
end


10.times do
  a=Attendance.create(stripe_customer_id: Faker::Code.ean, user: User.last, event: Event.last)
end

