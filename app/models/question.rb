class Question < ApplicationRecord

  belongs_to :test

  has_many :answers, dependent: :destroy  

  validates :title, presence: true,
                    uniqueness: { scope: :test }
end
