
admin = Admin.create!(name: "BinhPham",
                      email: "binh@gmail.com",
                      password: "123456",
                     )

user = User.create!(name: "Winfrey",
             email: "win@gmail.com",
             full_name: "Oprah Winfrey",
             phone_number: "0964980884",
             address: "America"
            )

50.times do |n|
name  = Faker::Name.name
email = "ex-#{n+1}@gmail.com"
User.create!(name: name,
            email: email,
            full_name: "Oprah Winfrey",
            phone_number: "0964980884",
            address: "America"
              )
 end
