class TestsUser < ApplicationRecord

  belongs_to :user
  belongs_to :passed_test, class_name: "Test", foreign_key: 'test_id'

end