class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authorize 
  
  protected 
  # Checks if the user is logged in if not it will redirect to loging page 
  def authorize 
    if (!current_user) 
      redirect_to login_path
    end
  end
  
  private 
  # current_user is a method for fetching the current user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user 
end
