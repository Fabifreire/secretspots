
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 category = %w[monument mirador panoramic beach bay cliff]
 boolean = [true, false]
puts "cleaning the database..."
Report.destroy_all
Like.destroy_all
Review.destroy_all
Spot.destroy_all
# User.destroy_all
puts "creating moderator"
User.create(first_name: "Mr", last_name: "Moderator", username: "Mr.Moderator", email: "mrmoderator@hotmail.com", password:"123456", moderator: true)
puts "generating 5 users"
5.times do
  puts "."
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.name, email: Faker::Internet.email, password: '123456')
end
puts "done"

puts "generating 10 spots"

#  Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "Carcavelos", category: category.sample)
#  Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "Parede", category: category.sample)
#  Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "Oeiras", category: category.sample)
#  Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "Lisboa", category: category.sample)
# Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "barcelona", category: category.sample)
# Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "Madrid", category: category.sample)
# Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "Paris", category: category.sample)
# Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "Rome", category: category.sample)
# Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "London", category: category.sample)
# Spot.create(user: User.all.sample, name: Faker::Dessert.flavor, description: Faker::Quotes::Shakespeare.hamlet_quote, address: "Rua do Instituto Bacteriológico 8, Lisboa", category: category.sample)
puts "Success!"

 puts "generating 30 reviews"
 30.times do
  Review.create(user: User.all.sample, spot: Spot.all.sample, description: Faker::Quotes::Shakespeare.hamlet_quote, title: Faker::Name.name, rating: rand(0..5))
end 
puts "Success!"


puts "generating 100 likes"
100.times do
  Like.create(user: User.all.sample, review: Review.all.sample)
end
puts "Success!"

# puts "generating 20 reports"
# 20.times do
#   Report.create(user: User.all.sample, review: Review.all.sample, spot: Spot.all.sample, description: Faker::Quotes::Shakespeare.hamlet_quote, done: boolean.sample)
# puts "."
# end
# puts "Success!"
