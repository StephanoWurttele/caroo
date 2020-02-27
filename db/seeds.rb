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
vehicle_4 = URI.open('https://images.unsplash.com/photo-1517524008697-84bbe3c3fd98?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80')
vehicle_5 = URI.open('https://images.unsplash.com/photo-1532581140115-3e355d1ed1de?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')
vehicle_6 = URI.open('https://images.unsplash.com/photo-1471289549423-04adaecfa1f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1906&q=80')
vehicle_7 = URI.open('https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80')
vehicle_8 = URI.open('https://images.unsplash.com/photo-1502877338535-766e1452684a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80')

profile_pic1 = URI.open('https://cdn.guidingtech.com/media/assets/WordPress-Import/2012/10/Smiley-Thumbnail.png')
profile_pic2 = URI.open('https://cdn2.f-cdn.com/contestentries/1376995/30494909/5b5e3e75ab981_thumb900.jpg')
profile_pic3 = URI.open('https://cdn.guidingtech.com/media/assets/WordPress-Import/2012/10/Smiley-Thumbnail.png')

user1 = User.create!(username: "stephanoFW", name: "Stephano", email: "stephanoFW@gmail.com", password:"123456", password_confirmation:"123456", address: '16 Villa Gaudelet, Paris')
user1.photo.attach(io: profile_pic1, filename: 'pp1.png', content_type: 'image/png')
car1 = Car.create!(description: "Electric car,nice specs", price: 160, model: Faker::Vehicle.model, kind: "Electric", brand: Faker::Vehicle.manufacture, user: user1)
car1.photo.attach(io: vehicle_1, filename: 'vehicle_1.png', content_type: 'image/jpg')
car1.reviews.create!(rating: 5, content: 'Pretty damn good')
car4 = Car.create!(description: "Audi A8 white,automatic", price: 150, model: "A8", kind: "Petrol", brand: "Audi", user: user1)
car4.photo.attach(io: vehicle_4, filename: 'vehicle_4.png', content_type: 'image/jpg')
car4.reviews.create!(rating: 5, content: 'Lovely car,will book again in future')

user2 = User.create!(username: "MaxD", name: "Max", email: "max.t.denton@gmail.com", password:"123456", password_confirmation:"123456", address: 'SW6 6DX, London')
user2.photo.attach(io: profile_pic2, filename: 'pp2.png', content_type: 'image/jpg')
car2 = Car.create!(description: "Electric car, blue", price: 170, model: Faker::Vehicle.model, kind: "Electric", brand: Faker::Vehicle.manufacture, user: user1)
car2.photo.attach(io: vehicle_2, filename: 'vehicle_2.png', content_type: 'image/jpg')
car2.reviews.create!(rating: 4, content: 'Damn good')
car5 = Car.create!(description: "Lamborghini Aventador orange,manual", price: 250, model: "Aventador", kind: "Diesel", brand: "Lamborghini", user: user1)
car5.photo.attach(io: vehicle_5, filename: 'vehicle_5.png', content_type: 'image/jpg')
car5.reviews.create!(rating: 5, content: 'Super fast car')
car8 = Car.create!(description: "BMW M3, blue, sport, automatic", price: 220, model: "M3", kind: "Diesel", brand: "BMW", user: user1)
car8.photo.attach(io: vehicle_8, filename: 'vehicle_8.png', content_type: 'image/jpg')
car8.reviews.create!(rating: 5, content: 'Awesome car,,,loved it')

user3 = User.create!(username: "MaxV", name: "Stephano", email: "max.v@gmail.com", password:"123456", password_confirmation:"123456", address: "Shoreditch Stables, North, 138 Kingsland Rd, London E2 8DY")
user3.photo.attach(io: profile_pic3, filename: 'pp3.png', content_type: 'image/png')
car3 = Car.create!(description: "Environmently friendly car for rent", price: 180, model: Faker::Vehicle.model, kind: "Electric", brand: Faker::Vehicle.manufacture, user: user2)
car3.photo.attach(io: vehicle_3, filename: 'vehicle_3.png', content_type: 'image/jpg')
car3.reviews.create!(rating: 3, content: 'good')
car6 = Car.create!(description: "Bentley Continental, sport, blue, automatic", price: 200, model: "Continental", kind: "Diesel", brand: "Bentley", user: user2)
car6.photo.attach(io: vehicle_6, filename: 'vehicle_6.png', content_type: 'image/jpg')
car6.reviews.create!(rating: 4, content: 'Great service,really nice car')
car7 = Car.create!(description: "Porsche Panamera, black, automatic", price: 200, model: "Panamera", kind: "Hybrid", brand: "Porsche", user: user2)
car7.photo.attach(io: vehicle_7, filename: 'vehicle_7.png', content_type: 'image/jpg')
car7.reviews.create!(rating: 5, content: 'The car of my dreams,glad i could drive it')

booking1 = Booking.create!(car: car1, user: user2, initial_date: DateTime.now.to_date, final_date: DateTime.now.to_date)
booking2 = Booking.create!(car: car3, user: user1, initial_date: DateTime.now.to_date, final_date: DateTime.now.to_date)
