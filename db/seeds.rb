# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'starting..'
User.destroy_all
Booking.destroy_all
Petsitter.destroy_all

  User.create!(
    name: "Youssef",
    email: "youyou_du_54@gmail.com",
    password: "lolola",
    photo: File.open(File.join(Rails.root, "/app/assets/images/youyou.png"))
  )

  User.create!(
    name: "Clement",
    email: "clement@gmail.com",
    password: "lololaa",
    photo: File.open(File.join(Rails.root, "/app/assets/images/clement.png"))
  )

  User.create!(
    name: "Margaux",
    email: "margaux@gmail.com",
    password: "lololaae",
    photo: File.open(File.join(Rails.root, "/app/assets/images/margaux.jpeg"))
  )

  User.create!(
    name: "Totor",
    email: "totor@gmail.com",
    password: "lololaaez",
    photo: File.open(File.join(Rails.root, "/app/assets/images/totor.jpg"))
  )

categories = %w[chien chat éléphant kangal hamster tortue]
# day_price = %w()

User.find_each do |user|
  Petsitter.create!(
    description: "je garde tous vos animaux",
    category: categories.sample,
    location: "Paris",
    price: rand(100),
    user: user,
    photo: File.open(File.join(Rails.root, "/app/assets/images/chat.jpg"))
  )
end

10.times do
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
