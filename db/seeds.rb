puts "cleaning the database..."
Spot.destroy_all

puts "Creating spots..."
 10.times do
 Spot.create(name:Faker::Color.color_name, address: Faker::Address.city, description: "This spot is amazing!", category: "By the ocean")
end
puts "done"
