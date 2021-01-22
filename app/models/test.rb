class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true

  # RABOTAET
  validates :title, uniqueness: {scope: :level}
  
  # RABOTAET
  validates :level, numericality: {grater_than_or_equal_to: 0 , less_than_or_equal_to: 10} 

 
  scope :by_difficult, -> (difficulty) {where(level: level_of_difficult(difficulty))}
  scope :desc_sorted_with_category, -> (category_title) {
      joins(:category)
      .where(categories: { title: category_title })
      .order(id: :desc)
      .pluck(:title)
  }

  def self.level_of_difficult(value)
    case value
    when "easy"
      (0..1)
    when "medium"
      (2..4)
    when "hard"
      (5..Float::INFINITY)
    end
  end

  
end
