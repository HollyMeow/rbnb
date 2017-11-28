# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "starting.."

User.destroy_all
Petsitter.destroy_all

50.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

categories = %w(chien chat éléphant kangal hamster tortue)
# day_price = %w()

User.find_each do |user|
  Petsitter.create!(
    description: Faker::Pokemon.name,
    category: categories.sample,
    location: Faker::Address.street_name,
    price: rand(100),
    user: user
  )
end

puts "End, #{Petsitter.count} pets added to DB"
