# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
puts "deleting all restaurants and reviews"

Review.delete_all
Restaurant.delete_all

puts Restaurant.count
puts Review.count

puts "creating new restaurants"

20.times do
  name = Faker::Restaurant.name
  address = Faker::Address.community
  phone = Faker::PhoneNumber.cell_phone
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  Restaurant.create(name: name, address: address, phone_number: phone, category: category)
end

list_ids = Restaurant.all
array_of_ids = []
list_ids.each do |restaurant|
  array_of_ids << restaurant.id
end


100.times do
  Review.create(content: Faker::Restaurant.review, rating: rand(1..5), restaurant_id: array_of_ids.sample)
end

puts Restaurant.count
puts Review.count


random = array_of_ids.sample
puts Restaurant.find(random).name
puts Restaurant.find(random).address
puts Restaurant.find(random).category
reviews = Restaurant.find(random).reviews
number = 1
reviews.each do |review|
  puts "review number #{number}"
  puts review.content
  puts review.rating
  number += 1
end
