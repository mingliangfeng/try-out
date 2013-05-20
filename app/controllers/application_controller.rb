class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

private
  def current_user
    @current_user ||= User.find(user_id) if user_id
  end
  
  def user_id
    session[:user_id]
  end
  
  def user_id=(user_id)
    session[:user_id] = user_id
  end
  
end
