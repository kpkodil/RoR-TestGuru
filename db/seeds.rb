# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 
unless Test.exists?
  categories = Category.create!([
    {title: "Category1"},
    {title: "Category2"}
  ])

  users = User.create!([
    {name: "User1"},
    {name: "User2"}
  ])

  tests = Test.create!([
    {title: "Test1",           category: category[0], author_id: users[0].id},
    {title: "Test2", level: 1, category: category[1], author_id: users[1].id},
    {title: "Test3", level: 1, category: category[0], author_id: users[1].id}
  ])

  questions = Question.create!([
    {title: "Question1", test_id: tests[0].id},
    {title: "Question2", test_id: tests[0].id},
    {title: "Question3", test_id: tests[1].id},
    {title: "Question4", test_id: tests[1].id},
    {title: "Question5", test_id: tests[2].id},
    {title: "Question6", test_id: tests[2].id}
  ])

  Answer.create!([
    {title: "Answer1", question_id: questions[0].id},
    {title: "Answer2", question_id: questions[0].id},
    {title: "Answer3", question_id: questions[1].id},
    {title: "Answer4", question_id: questions[1].id},
    {title: "Answer5", question_id: questions[2].id},
    {title: "Answer6", question_id: questions[3].id},
    {title: "Answer7", question_id: questions[4].id},
    {title: "Answer8", question_id: questions[5].id}
  ])

  TestsUser.create!([
    {user_id: users[0].id, test_id: tests[0].id},
    {user_id: users[0].id, test_id: tests[1].id},
    {user_id: users[0].id, test_id: tests[2].id}
  ])

  # AuthorTests.create!([
  #   {author_id: users[0].id, test_id: tests[0].id},
  #   {author_id: users[0].id, test_id: tests[1].id},
  #   {author_id: users[0].id, test_id: tests[2].id}
  # ])
end
