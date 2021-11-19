# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

LearningPath.delete_all
LearningPath.create!(
  title: 'Frontend',
  description: 'Step by step guide to becoming a frontend developer'
)

LearningPath.create!(
  title: 'Backend',
  description: 'Step by step guide to becoming a backend developer'
)

LearningPath.create!(
  title: 'DevOps',
  description: 'Step by step guide for DevOps or operations role'
)

6.times do
  LearningPath.create!(
    title: Faker::Name.unique.name,
    description: Faker::Lorem.sentence
  )
end
