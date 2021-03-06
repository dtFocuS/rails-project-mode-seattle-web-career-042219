# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]

single_days = ["01", "02", "03", "04", "05", "06", "07", "08", "09"]
#multi_days = (10..28).to_a

#single_days << multi_days
#single_days = single_days.flatten

am_pm = ["am", "pm"]

true_false = [true, false]

Image_Array = ["cat-hi-dpi.jpg", "jane-hi-dpi.jpg", "john-hi-dpi.jpg", Faker::Avatar.image]


20.times do
  User.create(display_name: Faker::Name.name, user_name: Faker::Twitter.screen_name, password: 'passw0rd', email: Faker::Internet.email)
end

200.times do
  user_1 = User.find(rand(1..9))
  user_2 = User.find(rand(9..20))
  Relationship.create_reciprocal_for_ids(user_1.id, user_2.id)
end

User.all.each do |user|
  rand(1..2).times do
    task = Task.create(description: Faker::Hipster.sentence, date: "2019-#{months.sample}-#{single_days.sample}", start_time: "#{rand(1-12)}#{am_pm.sample}", end_time: "#{rand(1-12)}#{am_pm.sample}", user_id: user.id, urgent: true_false.sample)
  end
end
