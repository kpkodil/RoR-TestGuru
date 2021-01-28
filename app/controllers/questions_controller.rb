class QuestionsController < ApplicationController

  before_action :set_test
  before_action :set_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render json: @questions
  end

  def show; end

  def new; end

  def create
    @question = @test.questions.create(question_params)
    if @question.errors.empty?
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def destroy
    @question.destroy
    redirect_to action: "index"
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
