class Answer < ApplicationRecord

  belongs_to :question

  validates :title, presence: true
  
  validate :validate_number_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_number_of_answers
    errors.add(:question, 'must have less or equal than 4 answers') if 
      question.answers.size > 4
  end

end
