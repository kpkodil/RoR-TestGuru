# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category1 = Category.create(title: "Category1")
user1 = User.create(name: "User1")
test1 =Test.create(title: "Test1", category_id: category1.id, author_id: user1.id)
question1 = Question.create(title: "Question1", test_id: test1.id)
answer1 = Answer.create(title: "Answer1", correct: true, question_id: question1.id)
