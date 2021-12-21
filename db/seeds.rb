# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

LearningPathStepSkill.delete_all
LearningPathStep.delete_all
Skill.delete_all
SkillType.delete_all
LearningPath.delete_all

SkillType.create!(
  name: "Concept"
)
db_type = SkillType.create!(
  name: "Database"
)
language_type = SkillType.create!(
  name: "Programming Language"
)
SkillType.create!(
  name: "Tool"
)

databases = %w[MariaDB MySQL MSSQL Oracle PostgreSQL]
databases.each do |database|
  Skill.create!(
    name: database,
    skill_type: db_type
  )
end

languages = %w[C# Go Java JavaScript Kotlin Python Ruby Swift]
languages.each do |language|
  Skill.create!(
    name: language,
    skill_type: language_type
  )
end

LearningPath.create!(
  title: "Frontend",
  description: "Step by step guide to becoming a frontend developer"
)

backend_path = LearningPath.create!(
  title: "Backend",
  description: "Step by step guide to becoming a backend developer"
)

LearningPath.create!(
  title: "DevOps",
  description: "Step by step guide for DevOps or operations role"
)

relational_databases_step = LearningPathStep.create!(
  title: "Relational Databases",
  learning_path: backend_path
)

languages_step = LearningPathStep.create!(
  title: "Programming Languages",
  learning_path: backend_path
)

Skill.all.where(skill_type: language_type).each do |skill|
  LearningPathStepSkill.create!(
    learning_path_step: languages_step,
    skill: skill
  )
end

Skill.all.where(skill_type: db_type).each do |skill|
  LearningPathStepSkill.create!(
    learning_path_step: relational_databases_step,
    skill: skill
  )
end

6.times do
  LearningPath.create!(
    title: Faker::Name.unique.name,
    description: Faker::Lorem.sentence
  )
end

User.delete_all

User.create!(
  first_name: "Alexis",
  last_name: "Ortega",
  email: "alexis@gmail.com",
  password: "password",
  admin: true
)

99.times do
  User.create!(
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
  )
end
