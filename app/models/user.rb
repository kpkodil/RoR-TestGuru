class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :passed_tests, through: :tests_users, foreign_key: 'test_id'
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true

  scope :passing_tests, -> (tests_level, user ) {
    Test
    .joins(:tests_users)
    .where(level: tests_level)
    .where(tests_users: { user_id: user.id })
  }

  def passing_tests_level(tests_level)
    self.class.passing_tests(tests_level, self)
  end
  
end
