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
