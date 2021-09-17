# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
3.times do
  user = User.create!({ email: Faker::Internet.email, password: Faker::Internet.password })
  category = user.categories.create!({ name: Faker::Book.genre })
  user.posts.create!({
                       title: Faker::Book.title,
                       body: Faker::Lorem.paragraph_by_chars(number: 5, supplemental: false),
                       category_id: category.id
                     })
end
