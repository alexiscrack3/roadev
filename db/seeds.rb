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
message_broker_type = SkillType.create!(
  name: "Message Broker"
)
tool_type = SkillType.create!(
  name: "Tool"
)

relational_databases = %w[ MariaDB MySQL MSSQL Oracle PostgreSQL ]
relational_databases.each do |database|
  Skill.create!(
    name: database,
    skill_type: db_type
  )
end

non_relational_databases = %w[ DynamoDB MongoDB ]
non_relational_databases.each do |database|
  Skill.create!(
    name: database,
    skill_type: db_type
  )
end

languages = %w[ C# Go Java JavaScript Kotlin PHP Python Ruby Rust Swift ]
languages.each do |language|
  Skill.create!(
    name: language,
    skill_type: language_type
  )
end

repositories = %w[ Bitbucket GitHub GitLab ]
repositories.each do |repository|
  Skill.create!(
    name: repository,
    skill_type: tool_type
  )
end

message_brokers = %w[ Kafka RabbitMQ ]
message_brokers.each do |message_broker|
  Skill.create!(
    name: message_broker,
    skill_type: message_broker_type
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

non_relational_databases_step = LearningPathStep.create!(
  title: "NoSQL Databases",
  learning_path: backend_path
)

languages_step = LearningPathStep.create!(
  title: "Programming Languages",
  learning_path: backend_path
)

repositories_step = LearningPathStep.create!(
  title: "Repo Hosting Service",
  learning_path: backend_path
)

message_broker_step = LearningPathStep.create!(
  title: "Message Brokers",
  learning_path: backend_path
)

Skill.where(skill_type: db_type).and(Skill.where.not(name: non_relational_databases)).each do |skill|
  LearningPathStepSkill.create!(
    learning_path_step: relational_databases_step,
    skill: skill
  )
end

Skill.where(skill_type: db_type).and(Skill.where(name: non_relational_databases)).each do |skill|
  LearningPathStepSkill.create!(
    learning_path_step: non_relational_databases_step,
    skill: skill
  )
end

Skill.where(skill_type: language_type).each do |skill|
  LearningPathStepSkill.create!(
    learning_path_step: languages_step,
    skill: skill
  )
end

Skill.where(skill_type: tool_type).and(Skill.where(name: repositories)).each do |skill|
  LearningPathStepSkill.create!(
    learning_path_step: repositories_step,
    skill: skill
  )
end

Skill.where(skill_type: message_broker_type).each do |skill|
  LearningPathStepSkill.create!(
    learning_path_step: message_broker_step,
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
