User.create!(name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: 1)

User.create!(name: "User Clone",
  email: "clone@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: 0)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "1"
  User.create! name: name, email: email, password: password,
    password_confirmation: password, role: 0
end
