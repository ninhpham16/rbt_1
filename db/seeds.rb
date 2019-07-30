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

10.times do |n|
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
  name = Faker::Movie.unique.quote
  category = Category.first
  Movie.create!(name: name,
                available: true,
                category: category,
                trailer: "https://www.youtube.com/watch?v=Nt9L1jCKGnE")
end
time = Faker::Time.between(DateTime.now - 1, DateTime.now)

movie_theater = MovieTheater.create!(theater_id: theater.id, movie_id: Movie.first.id, room_id: room.id, time: time)
movie_theater1 = MovieTheater.create!(theater_id: theater1.id, movie_id: Movie.second.id, room_id: room2.id, time: time)

def create_showtime_seats room_id, movie_theater_id
  room = Room.find room_id
  room.seats.each do |seat|
    showtime_seat = ShowtimeSeat.new
    showtime_seat.movie_theater_id = movie_theater_id
    showtime_seat.seat_id = seat.id
    showtime_seat.seat_available = seat.available
    showtime_seat.save
  end
end

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

create_showtime_seats room.id, movie_theater.id
create_showtime_seats room2.id, movie_theater1.id

ShowtimeSeat.first.update_attributes(seat_available: false)
ShowtimeSeat.last.update_attributes(seat_available: false)

10.times do
  name = Faker::Address.unique.city
  City.create(name: name)
end

2.times do |n|
  name = Faker::Address.unique.state
  City.create!(name:  name)
end

2.times do |n|
  name = Faker::Name.name
  city = City.all.sample
  Theater.create!(name: name,
                  city: city)
end

5.times do |n|
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
