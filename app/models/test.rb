# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions

  has_many :tests_users
  has_many :users, through: :users

  belongs_to :author, class_name: 'User'

  belongs_to :category

  def self.desc_sorted_with_category(category_title)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ?', category_title)
      .order(id: :desc)
      .pluck(:title)
  end
end
