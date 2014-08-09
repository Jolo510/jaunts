class WelcomeController < ApplicationController
  # No need to be logged in for welcome page 
  skip_before_action :authorize
  
end
