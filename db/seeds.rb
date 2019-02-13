# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

15.times do |i|
  user = User.create!(
      first_name: Faker::Internet.username,
      last_name: Faker::LeagueOfLegends.champion,
      description: Faker::LeagueOfLegends.quote,
      email: Faker::Internet.email,
      password: Faker::Space.agency)
  print '.'
end
puts '=== User DB created ==='

10.times do |j|
  j += 1
  event = Event.create!(
      user_id: User.all.sample.id,
      title: Faker::Music.instrument + Faker::Music.instrument,
      description: Faker::HitchhikersGuideToTheGalaxy.quote + Faker::MostInterestingManInTheWorld.quote,
      start_date: Faker::Date.forward(rand(1..666)),
      duration: j * 5,
      price: rand(1..1000),
      location: Faker::LeagueOfLegends.location)
  print '.'
end
puts '=== Event DB created ==='

30.times do |k|
  attendance = Attendance.create!(
      user_id: User.all.sample.id,
      event_id: Event.all.sample.id,
      stripe_customer_id: Faker::Business.credit_card_number)
  print '.'
end
