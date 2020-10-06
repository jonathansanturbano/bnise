# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Artwork.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

puts "Creating Admin User..."

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "Creating Artworks..."

ms1 = Sculpture.new(name: "My Sculpture", price: 150)
my_1 = File.open(Rails.root + "app/assets/images/my_sculpture.jpg")
ms1.photos.attach(io: my_1, filename: 'my-1.jpg', content_type: 'image/jpg')
my_2 = URI.open("https://images.unsplash.com/photo-1543536833-6d65fcc64f66?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60")
ms1.photos.attach(io: my_2, filename: 'my-2.jpg', content_type: 'image/jpg')
ms1.save

ms2 = Sculpture.new(name: "Your Sculpture", price: 180)
friends_1 = File.open(Rails.root + "app/assets/images/your_sculpture.jpg")
ms2.photos.attach(io: friends_1, filename: 'friends-1.jpg', content_type: 'image/jpg')
friends_2 = URI.open("https://live.staticflickr.com/1428/5112096481_b7166a86bb_b.jpg")
ms2.photos.attach(io: friends_2, filename: 'friends-2.jpg', content_type: 'image/jpg')
friends_3 = URI.open("https://i.pinimg.com/originals/31/33/6b/31336b054c49b994f5c775cc44ff23d8.jpg")
ms2.photos.attach(io: friends_3, filename: 'friends-3.jpg', content_type: 'image/jpg')
ms2.save

ms3 = Sculpture.new(name: "Our Sculpture", price: 300)
got_1 = File.open(Rails.root + "app/assets/images/our_sculpture.jpg")
ms3.photos.attach(io: got_1, filename: 'got-1.jpg', content_type: 'image/jpg')
got_2 = URI.open("https://static.boredpanda.com/blog/wp-content/uploads/2015/06/game-of-thrones-real-life-locations-25__880.jpg")
ms3.photos.attach(io: got_2, filename: 'got-2.jpg', content_type: 'image/jpg')
got_3 = URI.open("https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/Croatia/Dubrovnik/dubrovnik-city-walls-lead-guide.jpg?imwidth=1400")
ms3.photos.attach(io: got_3, filename: 'got-3.jpg', content_type: 'image/jpg')
ms3.save

ms4 = Sculpture.new(name: "Their Sculpture", price: 350)
titanic_1 = File.open(Rails.root + "app/assets/images/their_sculpture.jpg")
ms4.photos.attach(io: titanic_1, filename: 'titanic-1.jpg', content_type: 'image/jpg')
titanic_2 = URI.open("https://images.unsplash.com/photo-1420496401585-7f22ce8b8b8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60")
ms4.photos.attach(io: titanic_2, filename: 'titanic-2.jpg', content_type: 'image/jpg')
titanic_3 = URI.open("https://i.dailymail.co.uk/i/pix/2012/04/11/article-2128270-128CE485000005DC-44_966x635.jpg")
ms4.photos.attach(io: titanic_3, filename: 'titanic-3.jpg', content_type: 'image/jpg')
ms4.save
