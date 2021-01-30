class QuestionsController < ApplicationController

  before_action :set_test, only: %i[index create new destroy]
  before_action :set_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render json: @questions
  end

  def show; end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_questions_path(@test)
    else
      render "new"
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end

  def question_params
    params.require(:question).permit(:title, :test)
  end
end
