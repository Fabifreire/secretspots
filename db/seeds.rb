
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = %w[monument mirador panoramic beach bay cliff]
puts "cleaning the database..."
Spot.destroy_all
User.destroy_all

puts "generating 10 users"
10.times do
  puts "."
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.name, email: Faker::Internet.email, password: '123456')
end
puts "done"

puts "generating 10 spots"

Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: 'alfama, lisboa', category: category.sample)
Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: 'tpur eiffel, paris', category: category.sample)
Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: 'anjos, lisboa', category: category.sample)
Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: 'campos santana, lisboa', category: category.sample)


puts "done"


