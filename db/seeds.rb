# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_seed = [
  "Category1",
  "Category2"   
]
categories_seed.each do |title|
  if Category.where(title: title).empty?
    Category.create!(title: title)
  end 
end

users = [
  "User1",
  "User2"
]
users.each do |name|
  if User.where(name: name).empty?
    User.create!(name: name)
  end
end

tests = [
  ["Test1", Category.find_by(id: 1).id, User.find_by(id: 1).id],
  ["Test2", Category.find_by(id: 2).id, User.find_by(id: 2).id],
  ["Test3", Category.find_by(id: 1).id, User.find_by(id: 1).id]  
]
tests.each do |title, category_id, author_id|
  if Test.where(title: title, category_id: category_id, author_id: author_id).empty?
    Test.create!(title: title, category_id: category_id, author_id: author_id)
  end
end

questions = [
  ["Question1", Test.find_by(id: 1).id],
  ["Question2", Test.find_by(id: 2).id]
]
questions.each do |title, test_id|
  if Question.where(title: title, test_id: test_id).empty?
    Question.create!(title: title, test_id: test_id)
  end
end

answers = [
  ["Answer1", Question.find_by(id: 1).id],
  ["Answer2", Question.find_by(id: 2).id],
  ["Answer3", Question.find_by(id: 1).id]  
]
answers.each do |title,question_id|
  if Answer.where(title: title, question_id: question_id).empty?
    Answer.create!(title: title, question_id: question_id)
  end
end

usertests = [
  [User.find_by(id: 1).id, Test.find_by(id: 1).id],
  [User.find_by(id: 1).id, Test.find_by(id: 2).id],
  [User.find_by(id: 1).id, Test.find_by(id: 3).id]  
]
usertests.each do |user_id,test_id|
  if UserTest.where(user_id: user_id, test_id: test_id).empty?
    UserTest.create!(user_id: user_id, test_id: test_id)
  end
end
