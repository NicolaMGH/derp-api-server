# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




user1 = User.create!(name:"Kelvin", email:"kkwon39@gmail.com", password: "123", password_confirmation: "123")
user2 = User.create!(name:"RayKay", email:"raykay39@gmail.com", password: "123", password_confirmation: "123")
user3 = User.create!(name:"Nick", email:"nick39@gmail.com", password: "123", password_confirmation: "123")

itinerary1 = user1.itineraries.create!(name:"Exiciting Day")
itinerary2 = user2.itineraries.create!(name:"Romantic Night")
itinerary3 = user3.itineraries.create!(name:"Labour Day")


item1 = itinerary1.items.create!(info:"expensive")
item2 = itinerary2.items.create!(info:"Med Price")
item3 = itinerary3.items.create!(info:"Cheap")
