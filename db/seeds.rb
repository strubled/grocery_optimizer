# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

  User.create!(name:  "Example User",
             email: "example2@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

1.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end 
users = User.order(:created_at).take(3)
1.times do
  
  users.each { |user| user.weekslists.create!(thing: "cabbage", store: "whole foods", amount: "2", zone: "3", bought: false) }
  users.each { |user| user.weekslists.create!(thing: "apples", store: "whole foods", amount: "2", zone: "1", bought: false) }
  users.each { |user| user.weekslists.create!(thing: "potatoes", store: "acme", amount: "2", zone: "2", bought: false) }
  users.each { |user| user.weekslists.create!(thing: "relish", store: "trader joes", amount: "2", zone: "4", bought: false) }

  users.each { |user| user.allitems.create!(thing: "cabbage", store: "acme", amount: "2", zone: "3") }
  users.each { |user| user.allitems.create!(thing: "apples", store: "acme", amount: "2", zone: "1") }
  users.each { |user| user.allitems.create!(thing: "potatoes", store: "wf", amount: "2", zone: "2") }
  users.each { |user| user.allitems.create!(thing: "relish", store: "acme", amount: "2", zone: "4") }

    users.each { |user| user.stores.create!(store: "acme") }
  users.each { |user| user.stores.create!(store: "wf") }
end

