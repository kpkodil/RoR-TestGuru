class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :passed_tests, through: :tests_users, foreign_key: 'test_id'
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def passing_tests_level(tests_level)
    Test
      .joins(:tests_users)
      .where(level: tests_level)
      .where(tests_users: { user_id: id })
  end
end
