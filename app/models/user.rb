class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :passed_tests, through: :tests_users, foreign_key: 'test_id'
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true

  scope :passing_tests, -> (tests_level, user) {
    user.passed_tests
    .where(level: tests_level)
  }

  def passable_tests_of_level(tests_level)
   self.class.passing_tests(tests_level, self)
   Test.joins(:tests_users)
   .by_level(tests_level)
   .where(tests_users: { user_id: id })
  end
  
end
