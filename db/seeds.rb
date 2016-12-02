# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'amax3002@gmail.com', full_name: 'Alex Guy', nickname: 'amax3002', password: 'password', password_confirmation: 'password' )
User.create(email: 'lguy@comcast.net', full_name: 'Laurent Guy', nickname: 'lguy3000', password: 'password', password_confirmation: 'password' )

rand(250..1000).times do
  new_password = FFaker::Internet.password
  user = User.create(
    full_name: FFaker::Name.name,
    email: FFaker::Internet.email,
    nickname: FFaker::Internet.user_name,
    password: new_password,
    password_confirmation: new_password
  )

  rand(1..5).times do
    user.tweets.create(
      message: FFaker::Tweet.tweet
    )
  end
end
