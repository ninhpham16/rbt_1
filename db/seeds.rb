admin = Admin.create!(name: "BinhPham",
                      email: "binh@gmail.com",
                      password: "123456",
                      password_confirmation: "123456"
                     )

user = User.create!(name: "Winfrey",
             email: "win@gmail.com",
             full_name: "Oprah Winfrey",
             phone_number: "0964980884",
             address: "America",
             password: "123456",
             password_confirmation: "123456"
            )

50.times do |n|
name  = Faker::Name.name
email = "ex-#{n+1}@gmail.com"
password = 123456
User.create!(name: name,
            email: email,
            full_name: "Oprah Winfrey",
            phone_number: "0964980884", 
            address: "America",
            password: password,
            password_confirmation: password
            )
end
city = City.create!(name: "HaNoi")
city1 = City.create!(name: "HCM")

theater = Theater.create!(name: "CGV1", city_id: city.id)
theater1 = Theater.create!(name: "CGV_HCM", city_id: city1.id)


room = Room.create!(name: "Spring", theater_id: Theater.first.id)
room2 = Room.create!(name: "Spring_HCM", theater_id: Theater.second.id)

10.times do |n|
  name = Faker::Name.name
  Category.create!(name: name)
end

10.times do |n|
  name = Faker::Movie.quote
  category = Category.first
  Movie.create!(name: name,
                available: true,
                category: category)
end
time = Faker::Time.between(DateTime.now - 1, DateTime.now)
movie_theater = MovieTheater.create!(theater_id: Theater.all.sample.id, movie_id: Movie.first.id, room_id: Room.all.sample.id, time: time)

def create_30_seats room_id
  for row in ("A".."E") do
    for col in (1..6) do
      seat = Seat.new
      seat.name = "#{row}#{col}"
      seat.room_id = room_id
      seat.available = true
      seat.save
    end
  end
end

create_30_seats room.id
create_30_seats room2.id

10.times do
  name = Faker::Address.unique.city
  City.create(name: name)
end

15.times do |n|
  name = Faker::Address.unique.state
  City.create!(name:  name)
end

50.times do |n|
  name = Faker::Name.name
  city = City.all.sample
  Theater.create!(name: name,
                  city: city)
end


10.times do |n|
  theater = Theater.first
  movie = Movie.all.sample
  time = Faker::Time.between(DateTime.now - 1, DateTime.now)
  room = Room.all.sample
  MovieTheater.create!(theater: theater,
                movie: movie,
                time: time,
                room: room)
end

50.times do |n|
  user = User.all.sample
  total = Faker::Number.number(5)
  Order.create!( user: user,
                 total: total,
                  )
end

movie = MovieTheater.all.sample
orders = Order.take(50)
5.times do |n|
  orders.each { |order| order.order_items.create!(movie_theater: movie, seat: Seat.first) } 
end
