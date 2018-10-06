# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'digest'

20.times do
  User.create([{
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    bio: Faker::GreekPhilosophers.quote,
    avatar: Faker::Avatar.image(Digest::SHA256.hexdigest (rand(1..50000)).to_s)
    }])
end
#
# 5.times do
#   Session.create([{
#     name: Faker::Company.catch_phrase,
#     transcript: Faker::Lebowski.quote,
#     time: Time.now,
#     details: Faker::Company.bs
#   }])
#     3.times do
#     Task.create([{
#       title: Faker::GameOfThrones.dragon,
#       body: Faker::Hipster.paragraph(7),
#       link: Faker::Internet.url,
#       session_id: rand(1..5)
#       }])
#     end
# end
