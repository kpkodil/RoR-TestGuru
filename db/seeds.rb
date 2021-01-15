# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Test.all.empty? 
  Category.create!([
    {title: "Category1"},
    {title: "Category2"}
  ])

  User.create!([
    {name: "User1"},
    {name: "User2"}
  ])

  Test.create!([
    {title: "Test1", category_id: 1, author_id: 1},
    {title: "Test2", category_id: 2, author_id: 2},
    {title: "Test3", category_id: 1, author_id: 2}
  ])

  Question.create!([
    {title: "Question1", test_id: 1},
    {title: "Question2", test_id: 1},
    {title: "Question3", test_id: 2},
    {title: "Question4", test_id: 2},
    {title: "Question5", test_id: 3},
    {title: "Question6", test_id: 3}
  ])

  Answer.create!([
    {title: "Answer1", question_id: 1},
    {title: "Answer2", question_id: 1},
    {title: "Answer3", question_id: 2},
    {title: "Answer4", question_id: 2},
    {title: "Answer5", question_id: 3},
    {title: "Answer6", question_id: 4},
    {title: "Answer7", question_id: 5},
    {title: "Answer8", question_id: 6}
  ])

  UserTest.create!([
    {user_id: 1, test_id: 1},
    {user_id: 1, test_id: 2},
    {user_id: 1, test_id: 3}
  ])
end
