class Test < ApplicationRecord

  belongs_to :category

  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy

  has_many :tests_users, dependent: :destroy

  has_many :users, through: :users

  def self.desc_sorted_with_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(id: :desc)
      .pluck(:title)
  end
end
