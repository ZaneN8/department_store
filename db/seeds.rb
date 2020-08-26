# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



3.times do |i|
  store_seed = Store.create(name: Faker::Commerce.department,
   description: Faker::Company.catch_phrase)
end


3.times do |i|
  store_seed.items.create(name: Faker::Commerce.product_name,
   description: Faker::Commerce.material, price: Faker::Commerce.price)
end