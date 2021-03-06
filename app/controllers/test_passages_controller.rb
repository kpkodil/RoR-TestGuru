class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.complited?
      @test_passage.set_result!
      BadgeDepartmentService.new(test_passage: @test_passage).call
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else  
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result
      Gist.create!(question: @test_passage.current_question, 
                    user: current_user, 
                    gist_url: result.html_url)
      
      flash[:notice] = t('.success', url: result.html_url )
    else
      flash[:alert] = t('.failure')
      
    end
    redirect_to @test_passage
  end

  private

  def sanitize(str)
    ActionController::Base.helpers.sanitize(str)
    
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
