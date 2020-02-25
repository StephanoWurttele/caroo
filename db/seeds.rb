# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(username: "stephanoFW", name: "Stephano", email: "stephanoFW@gmail.com", password:"123456", password_confirmation:"123456")
car1 = Car.create!(description: "Nice car 1", price: 160, model: Faker::Vehicle.model, kind: "electric", brand: Faker::Vehicle.manufacture, user: user1)
car1.reviews.create!(rating: 5, content: 'pretty damn good')

user2 = User.create!(username: "MaxD", name: "Max", email: "max.t.denton@gmail.com", password:"123456", password_confirmation:"123456")
car2 = Car.create!(description: "Nice car 2", price: 170, model: Faker::Vehicle.model, kind: "electric", brand: Faker::Vehicle.manufacture, user: user1)
car2.reviews.create!(rating: 4, content: 'damn good')

user3 = User.create!(username: "MaxV", name: "Stephano", email: "max.v@gmail.com", password:"123456", password_confirmation:"123456")
car3 = Car.create!(description: "Nice car 3", price: 180, model: Faker::Vehicle.model, kind: "electric", brand: Faker::Vehicle.manufacture, user: user2)
car3.reviews.create!(rating: 3, content: 'good')

booking1 = Booking.create!(car: car1, user: user2)
booking2 = Booking.create!(car: car3, user: user1)
