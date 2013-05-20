class SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth!(auth)
    self.user_id = user.id
    redirect_to root_url, notice: "Signed in!"
  end
  
  def destroy
    self.user_id = nil
    redirect_to root_url, notice: "Signed out!"
  end
  
  def failure
    redirect_to "/auth/#{params[:strategy]}", alert: "login failed! please check your email and password."
  end
    
end
