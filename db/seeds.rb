User.create!(name:  "Ahmed Fouad",
             email: "ahmedfouad2020era@gmail.com",
             password:              "123456789",
             password_confirmation: "123456789")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end