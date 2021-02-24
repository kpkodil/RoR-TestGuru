# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{  name: 'Star Wars'  }, {  name: 'Lord of the Rings'  }])
#   Character.create(name: 'Luke', movie: movies.first)
 
unless Test.exists? 
  categories = Category.create!([
    { title: "Category1" },
    { title: "Category2" }
  ])

  users = User.create!([
    { email: "sasha-burov@mail.ru", password: "password1", first_name: "Sasha", last_name: "Burov", type: "Admin" },
    { email: "kpkodil@gmail.com", password: "password2", first_name: "Pasha", last_name: "Burov" }
  ])

  tests = Test.create!([
    { title: "Test1",           category: categories[0], author: users[0] },
    { title: "Test2", level: 1, category: categories[1], author: users[0] },
    { title: "Test3", level: 1, category: categories[0], author: users[0] }
  ])

  questions = Question.create!([
    { title: "Question1", test: tests[0] },
    { title: "Question2", test: tests[0] },
    { title: "Question3", test: tests[1] },
    { title: "Question4", test: tests[1] },
    { title: "Question5", test: tests[2] },
    { title: "Question6", test: tests[2] }
  ])

  Answer.create!([
    { title: "Answer1 t", question: questions[0], correct: true },
    { title: "Answer2", question: questions[0] },
    { title: "Answer3 t", question: questions[1], correct: true },
    { title: "Answer4", question: questions[1] },
    { title: "Answer5 t", question: questions[2], correct: true },
    { title: "Answer6 t", question: questions[3], correct: true },
    { title: "Answer7 t", question: questions[4], correct: true },
    { title: "Answer8 t", question: questions[5], correct: true }
  ])

  Badge.create!(
    { title: "Pass all of the tests successfully",
      image_url: "image_url"
    }
  ).tests.push(Test.first, Test.second, Test.third)

end
