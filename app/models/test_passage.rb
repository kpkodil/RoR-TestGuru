class TestPassage < ApplicationRecord
  
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_update :before_update_set_next_question, unless: -> { complited? }

  scope :complited_successfully, -> { where(successful: true) } 

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1 
    end
    save!  
  end

  def complited?
    current_question.nil? || self.end_of_time?
  end

  def success?
    success_rate >= 85
  end

  def set_result!
    self.successful = true if self.complited? && self.success?
    save!
  end

  def success_rate
    (correct_questions.to_f / test.questions.count)*100
  end

  def number_of_current_question
    self.test.questions.index(current_question)
  end

  private

  def end_of_time?
    (Time.now - self.created_at) > self.test.timer*60
  end
  
  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
      next_question = test.questions.order(:id)
                                    .where('id > ?', current_question.id)
                                    .first
      self.current_question = next_question
  end
end
