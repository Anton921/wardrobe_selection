# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Style.create(
  title: 'Nefiltr2',
  content: 'sdf'
)

Category.create(
  title: 'Kraftove',
  style_id: 2
)

Category.create(
  title: 'Original',
  style_id: 2
)

Category.create(
  title: 'Kraftove2',
  style_id: 1
)
