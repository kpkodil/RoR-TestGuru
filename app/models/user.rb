require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, foreign_key: 'test_id'
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true
  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, on: :create

  has_secure_password

  def passable_tests_of_level(tests_level)
   Test.joins(:tests_users)
   .by_level(tests_level)
   .where(tests_users: { user_id: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
