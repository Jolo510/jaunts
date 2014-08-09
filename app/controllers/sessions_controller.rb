class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id 
    # Redirects to trips page after Logging in
    redirect_to trips_itinerary_url 
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url 
  end
  
end