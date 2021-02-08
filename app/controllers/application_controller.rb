class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?,
                :return_page

  private

  def authenticate_user!
    unless current_user
      cookies[:return_to] = request.original_url
      cookies[:return_to_method] = request.method.to_sym
      return redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end
    cookies[:email] = current_user.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def return_page
    cookies[:return_to] || root_path
  end
end
