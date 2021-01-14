class User < ApplicationRecord
  def passing_tests(test_level)
    id_of_tests_with_level = Test.where(level: test_level)
    id_of_passing_tests = UserTest.where(user_id: self.id, test_id: id_of_tests_with_level)
    pp Test.where(id: id_of_passing_tests)
  end
end
