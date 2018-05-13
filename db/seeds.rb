User.create!(name:  "Big Boss",
             email: "cvwo@cvwo.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@cvwo.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)

users = User.order(:created_at).take(6)
10.times do
 content = Faker::Lorem.sentence(5)
 users.each { |user| user.microposts.create!(content: content) }
end
end
