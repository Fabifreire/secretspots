
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = %w[monument mirador panoramic beach bay cliff]

User.destroy_all
Spot.destroy_all

puts "generating 10 users"
10.times do
  puts "."
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.name, email: Faker::Internet.email, password: '123456')
end
puts "done"

puts "generating 10 spots"
10.times do
  puts "."
  Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: Faker::Address.full_address, category: category.sample)
end

puts "done"
puts "cleaning the database..."

puts "Creating spots..."
 10.times do
 Spot.create(name:Faker::Color.color_name, address: Faker::Address.city, description: "This spot is amazing!", category: "By the ocean")
end
puts "done"
