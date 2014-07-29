OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '587446561363871', '4c4545fadd7423b955e17c70e1293c32'
end