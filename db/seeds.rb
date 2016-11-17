User.create!(name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: 1)

15.times do |n|
  name = Faker::Name.name
  email = "clone#{n+1}@gmail.com"
  password = "123456"
  User.create! name: name, email: email, password: password
end

PublicActivity.enabled = false
3.times do |n|
  name = Faker::Color.color_name
  Category.create! name: name
end

15.times do |n|
  name = Faker::Address.state
  category_id = Faker::Number.between(1, 3)
  introduction = Faker::Hipster.sentence
  picture = File.open(File.join(Rails.root, "/app/assets/images/seed_image.jpg"))
  Location.create! name: name, category_id: category_id,
    introduction: introduction, picture: picture, address: name
end
PublicActivity.enabled = true
users = User.all
user  = users.second
following = users[2..13]
followers = users[3..10]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
