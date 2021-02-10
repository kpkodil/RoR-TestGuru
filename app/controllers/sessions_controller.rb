class SessionsController < Devise::SessionsController
  
  def create
    super
    user = current_user
    unless user.first_name.empty? || user.last_name.empty?
      flash[:notice] = "Привет, #{user.first_name} #{user.last_name}!"
    end
  end
end
