require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vehicle_1 = URI.open('https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/evoque_d180s_2019_1202a.jpg?itok=B0mfVxHa')
vehicle_2 = URI.open('https://media.wired.com/photos/5d09594a62bcb0c9752779d9/master/pass/Transpo_G70_TA-518126.jpg')
vehicle_3 = URI.open('https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/1-rolls-royce-phantom-2018-review-otr-front.jpg?itok=D66zxiDE')

profile_pic1 = URI.open('https://cdn.guidingtech.com/media/assets/WordPress-Import/2012/10/Smiley-Thumbnail.png')
profile_pic2 = URI.open('https://cdn2.f-cdn.com/contestentries/1376995/30494909/5b5e3e75ab981_thumb900.jpg')
profile_pic3 = URI.open('https://cdn.guidingtech.com/media/assets/WordPress-Import/2012/10/Smiley-Thumbnail.png')

user1 = User.create!(username: "stephanoFW", name: "Stephano", email: "stephanoFW@gmail.com", password:"123456", password_confirmation:"123456")
user1.photo.attach(io: profile_pic1, filename: 'pp1.png', content_type: 'image/png')
car1 = Car.create!(description: "Nice car 1", price: 160, model: Faker::Vehicle.model, kind: "Electric", brand: Faker::Vehicle.manufacture, user: user1)
car1.photo.attach(io: vehicle_1, filename: 'vehicle_1.png', content_type: 'image/jpg')
car1.reviews.create!(rating: 5, content: 'pretty damn good')

user2 = User.create!(username: "MaxD", name: "Max", email: "max.t.denton@gmail.com", password:"123456", password_confirmation:"123456")
user2.photo.attach(io: profile_pic2, filename: 'pp2.png', content_type: 'image/jpg')
car2 = Car.create!(description: "Nice car 2", price: 170, model: Faker::Vehicle.model, kind: "Electric", brand: Faker::Vehicle.manufacture, user: user1)
car2.photo.attach(io: vehicle_2, filename: 'vehicle_2.png', content_type: 'image/jpg')
car2.reviews.create!(rating: 4, content: 'damn good')

user3 = User.create!(username: "MaxV", name: "Stephano", email: "max.v@gmail.com", password:"123456", password_confirmation:"123456")
user3.photo.attach(io: profile_pic3, filename: 'pp3.png', content_type: 'image/png')
car3 = Car.create!(description: "Nice car 3", price: 180, model: Faker::Vehicle.model, kind: "Electric", brand: Faker::Vehicle.manufacture, user: user2)
car3.photo.attach(io: vehicle_3, filename: 'vehicle_3.png', content_type: 'image/jpg')
car3.reviews.create!(rating: 3, content: 'good')

booking1 = Booking.create!(car: car1, user: user2)
booking2 = Booking.create!(car: car3, user: user1)
