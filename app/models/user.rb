class User < ApplicationRecord

  def passing_tests_level(tests_level)
    Test.joins("JOIN user_tests ON user_tests.test_id = tests.id").where("tests.level = ? ", tests_level).where("user_tests.user_id = ? ", self.id)
  end
end
