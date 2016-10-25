User.create!(name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: 1)

10.times do |n|
  name = Faker::Name.name
  email = "clone#{n+1}@gmail.com"
  password = "123456"
  User.create! name: name, email: email, password: password
end

PublicActivity.enabled = false
10.times do |n|
  name = Faker::Color.color_name
  Category.create! name: name
end

2.times do |n|
  name = Faker::Address.state
  category_id = Faker::Number.between(1, 10)
  introduction = Faker::Hipster.sentence
  picture = File.open(File.join(Rails.root, "/app/assets/images/seed_image.jpg"))
  Location.create! name: name, category_id: category_id, introduction: introduction, picture: picture
end
PublicActivity.enabled = true
