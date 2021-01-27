# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "delete all"
Restaurant.delete_all
puts "deleted all"

puts "create 10 records"
10.times do
  r = Restaurant.new
  r.name = Faker::Restaurant.name
  r.address = Faker::Address.street_address
  r.phone_number = Faker::PhoneNumber.phone_number
  r.category = ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  r.save

  puts r.id
end

puts "created 10 records"
