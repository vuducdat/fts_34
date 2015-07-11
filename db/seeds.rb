# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "User admin",
             email: "admin@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             role: "admin")

20.times do |n|
  name  = {Faker::Name.name}
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,)
end
Category.create!(name: "MySQL", exetime: 10)
Category.create!(name: "Git", exetime: 10)
Category.create!(name: "Ruby on Rails", exetime: 10)

categories = Category.all
30.times do |n|
  content = "Question #{n+1}"
  categories.each {|category| category.questions.create! content: content}
end

_MySQLQuestions = Category.find(1).questions
4.times do |n|
  content = "MySQL Answer #{n+1}"
  _MySQLQuestions.each {|question| question.answers.create! content: content, is_correct: n == 1}
end

_GitQuestions = Category.find(2).questions
4.times do |n|
  content = "Git Answer #{n+1}"
  _GitQuestions.each {|question| question.answers.create! content: content, is_correct: n == 1}
end

_RubyOnRailsQuestions = Category.find(3).questions
4.times do |n|
  content = "RubyOnRails Answer #{n+1}"
  _RubyOnRailsQuestions.each {|question| question.answers.create! content: content, is_correct: n == 1}
end
