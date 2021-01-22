class Answer < ApplicationRecord

  belongs_to :question

  validates :title, presence: true

  scope :right_answers, -> {where(correct: truereload!
    )}

end
