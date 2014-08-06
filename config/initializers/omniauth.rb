# Setting the OmniAuth logger to the rails logger
OmniAuth.config.logger = Rails.logger

# Adding OmniAuth to the Rack middleware 
# Setting provider to Facebook and passing in the App Id and App Secret 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '587446561363871', '4c4545fadd7423b955e17c70e1293c32'
end