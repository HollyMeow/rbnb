# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'starting..'
# User.destroy_all
# Booking.destroy_all

50.times do
  User.create!(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

categories = %w[chien chat éléphant kangal hamster tortue]
# day_price = %w()

User.find_each do |user|
  Petsitter.create!(
    description: Faker::HowIMetYourMother.quote,
    category: categories.sample,
    location: Faker::Address.street_name,
    price: rand(100),
    user: user
  )
end

50.times do
  Booking.create!(
    user: User.all.sample,
    petsitter: Petsitter.all.sample,
    date_start: "25-11-20",
    date_end: "25-11-25",
    total_price: rand(200),
    status: ['En attente', 'Accepté', 'Refusé'].sample
  )
end

puts "End, #{Petsitter.count} pets added to DB"
