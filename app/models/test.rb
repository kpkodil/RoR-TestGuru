class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true,
                    uniqueness: { scope: :level}
  validates_numericality_of :level, { greater_than_or_equal_to: 0,  
                                      only_integer: true
                                    } 

  scope :easy, -> { where(level: (0..1)) } 
  scope :medium, -> { where(level: (2..4)) } 
  scope :hard, -> { where(level: (5..10)) } 
  scope :by_level, -> (level) { where(level: level) }
  scope :desc_by_category_title, -> (category_title) { joins(:category)
                                                        .where(categories: { title: category_title })
                                                        .order(title: :desc)
                                                      }

  private

  def self.desc_sorted_by_category(category_title)
    desc_by_category_title(category_title).pluck(:title)
  end
end
