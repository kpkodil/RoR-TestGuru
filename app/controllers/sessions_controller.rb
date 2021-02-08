class SessionsController < ApplicationController
  
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to return_page
      cookies.delete(:return_to)
      cookies.delete(:return_to_method)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
