class TestsController < ApplicationController


  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
    render json: @tests
  end

  def show
    @test = Test.find(params[:id])
    render inline: '<%= @test.title %>'
  end

  def start
    render plain: 'Start certain test' 
  end

  def new; end

  def create
    test = Test.create!(test_params)
    if test.save
      redirect_to tests_path
    else
      render "new"
    end
  end

private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found!'    
  end

end
