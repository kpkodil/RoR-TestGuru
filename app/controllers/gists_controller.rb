class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.url.present?
      Gist.create!(question: @test_passage.current_question, 
                    user: current_user, 
                    gist_url: result.url)
      flash[:notice] = t( '.success', url: result[:html_url] )
    else                    
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  def html_url(resource)
    resource
  end
end