require 'faker'

User.create(
    first_name: "Joshua",
    last_name: "Croff",
    username: "joshcroff",
    password_hash: "tomtom",
    email: "joshua.croff@gmail.com",
    charity_id: 1
  )

20.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    password_hash: Faker::Internet.password,
    email: Faker::Internet.email,
    charity_id: 1
    )
end

Charity.create(
  name: "Community Housing Partnership",
  street_address: "20 Jones Street",
  secondary_address: "Suite 200",
  city: "San Francisco",
  state: "California",
  zip: "94102",
  phone: "4158525300",
  payment_method: "Website"
  )

2500.times do
  Transaction.create(
    amount: Faker::Commerce.price,
    user_id: rand(1..21)
    )
end


