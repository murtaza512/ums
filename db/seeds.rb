users = (1..1000).map { |_num| { name: Faker::Name.unique.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, title: Faker::Lorem.word } }

User.import users
