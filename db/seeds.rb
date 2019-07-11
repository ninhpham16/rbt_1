
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
User.create!(name: name,
            email: email,
            full_name: "Oprah Winfrey",
            phone_number: "0964980884",
            address: "America",
            password: "123456",
            password_confirmation: "123456"
            )
end
city = City.create(name: "HaNoi")
city1 = City.create(name: "HCM")

theater = Theater.create(name: "CGV1", city_id: city.id)
theater1 = Theater.create(name: "CGV_HCM", city_id: city1.id)

10.times do
    room = Room.create(name: "Spring", theater_id: theater.id)
    room2 = Room.create(name: "Spring_HCM", theater_id: theater1.id)
end
