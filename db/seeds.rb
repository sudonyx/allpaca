# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Alpaca.destroy_all
User.destroy_all

user1 = User.create!({ username: "test" email: 'test@test.com', password: 'password' })
user2 = User.create!({ username: "Josh" email: 'josh@test.com', password: 'password' })
user3 = User.create!({ username: "Bay" email: 'bay@test.com', password: 'password' })
user4 = User.create!({ username: "Ben" email: 'ben@test.com', password: 'password' })
user5 = User.create!({ username: "James" email: 'james@test.com', password: 'password' })

40.times do
  name = Faker::Artist.name
  colour = Faker::Color.color_name.capitalize
  hat = ['Trilby', 'Cowboy', 'Wizard Hat', 'Safety Helmet', 'Graduation Cap', 'Pied Piper Hat', 'Crown'].sample
  location = Faker::Address.city
  price_per_night = (20..100).to_a.sample

  alpaca = Alpaca.new({ name: name, colour: colour, hat: hat, location: location, price_per_night: price_per_night })
  alpaca.user = [user1, user2, user3, user4, user5].sample
  alpaca.save!
end
