# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Alpaca.destroy_all
User.destroy_all

user = User.create!({ email: 'test@test.com', password: 'password' })

10.times do
  name = Faker::Artist.name
  colour = Faker::Color.color_name.capitalize
  hat = ['Top hat', 'Trilby', 'Fedora', 'Bonnet', 'Baseball cap', 'Flat cap', 'Beanie', 'Bucket hat', 'Cowboy'].sample
  location = Faker::Address.city
  price_per_night = (20..100).to_a.sample

  alpaca = Alpaca.new({ name: name, colour: colour, hat: hat, location: location, price_per_night: price_per_night })
  alpaca.user = user
  alpaca.save!
end
