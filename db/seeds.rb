# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user = User.create!(
  name: 'Seller',
  email: 'seller@test.com',
  password: 'Seller1!',
  sex: 'male',
  age: 22
)
user.add_role(:seller)

product_options = %w[hero heroine villain name]

100.times.each do
  name = Faker::DcComics.public_send(product_options[rand(0..3)])
  description = Faker::Lorem.paragraph_by_chars(number: rand(20..100))

  product = Product.create!(
    name: {
      es: name,
      en: name
    },
    description: {
      es: description,
      en: description
    },
    stock: rand(0..10),
    price: {
      usd: rand(1..10),
      mxn: rand(20..200)
    }
  )

  product.create_cover!(
    path: 'https://picsum.photos/600/500'
  )
end
