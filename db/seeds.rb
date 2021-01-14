# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category1 = Category.create!(title: "Category1")
category2 =Category.create!(title: "Category2")
user1 = User.create!(name: "User1")
user2 = User.create!(name: "User2")
test1 =Test.create!(title: "Test1", level: 1, category_id: category1.id, author_id: user2.id)
test2 =Test.create!(title: "Test2", level: 2, category_id: category2.id, author_id: user2.id)
test3 =Test.create!(title: "Test3", level: 1, category_id: category2.id, author_id: user1.id)
question1 = Question.create!(title: "Question1", test_id: test1.id)
question2 = Question.create!(title: "Question2", test_id: test2.id)
answer1 = Answer.create!(title: "Answer1", question_id: question1.id)
answer2 = Answer.create!(title: "Answer2", question_id: question2.id)
answer3 = Answer.create!(title: "Answer3", question_id: question1.id)
user1test1 = UserTest.create!(user_id: user1.id, test_id: test1.id)
user1test2 = UserTest.create!(user_id: user1.id, test_id: test2.id)
user1test3 = UserTest.create!(user_id: user1.id, test_id: test3.id)
