class Badge < ApplicationRecord

  has_many :badge_ownings, dependent: :destroy
  has_many :users, through: :badge_ownings

  has_many :badge_tests
  has_many :tests, through: :badge_tests

  validates :title, presence: true
  validates :image_url, presence: true

  # конвертирование коллекции test_passages у юзера в массив тестов
  def converted_successful_test_passages_to_array_of_tests(user)
    tests = []
    user.test_passages.complited_successfully.pluck(:test_id).each { |t_id| tests.push(Test.find(t_id)) }
    return tests
  end

  # проверка всех успешно пройденных тестов для выдачи бейджа и выдача бейджа
  def check_for_all_badges(user)
    badges = Badge.all
    user_tests = converted_successful_test_passages_to_array_of_tests(user)
    badges.each do |badge|
        # проверка наличия бейдж-комбинации тестов в списке всех пройденных тестов юзера
        user.badges.push(badge) if (user_tests & badge.tests) == badge.tests
    end
  end
end
