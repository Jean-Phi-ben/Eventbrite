# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Je détruis les bases de données

require 'faker'

puts 'Je nettoie les BDD'

Event.destroy_all
User.destroy_all
Attendance.destroy_all

# Seed users
30.times do 
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name, 
        description: Faker::Lorem.sentence,
        email: Faker::Name.first_name + "#{rand(9999)}@yopmail.com", #Faker::Internet.email,
        encrypted_password: 'password'
    )
end

# Seed Event

20.times do 
    Event.create!(
        start_date: Faker::Date.forward(90),
        title: Faker::Lorem.sentence(3),
        description: Faker::Lorem.paragraph(3),
        duration: rand(1..30)*5,
        price: rand(1..1000),
        location: Faker::Address.community
    )
end

puts 'Jeu d\'essai Event avec 20 items'

# seed Attendance
puts '-> Je charge un jeu d\'essai Attendance'
10.times do
  Attendance.create!(
    stripe_customer_id: Faker::Number.unique.number(digits: 10),
    user: User.all.sample,
    event: Event.all.sample,
  )
end

puts 'Jeu d\'essai Attendance avec 10 items'
puts '***** Base de données chargée avec un seed ! Have a nive run.'