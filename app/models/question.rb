class Question < ApplicationRecord

  belongs_to :test

  has_many :answers, dependent: :destroy  

  validates :title, presence: true

  validates :answers, length: {in: 1..4,
    out_of_range: "range is 1 - 4"}
end
