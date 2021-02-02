class TestsController < ApplicationController

  before_action :set_test, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def start
    render plain: 'Start certain test' 
  end

  def new 
    @test = Test.new 
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end    
  end

  def destroy
    @test.destroy
    redirect_to tests_path(@test)
  end

private

  def set_test
   @test = Test.find(params[:id]) 
  end

  def test_params
    params.require(:test).permit(:title, :level, :category)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found!'    
  end

end
