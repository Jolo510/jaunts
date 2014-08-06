class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    # Used to find user that matches the given provider and uid values 
    # Then we call first_or_initialize
    # Will either return the first matching record or initialize a new record with params passed in 
    # Use tap to pass the user instacne to the block
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      # Setting various attributes to the user
      user.provider = auth.provider 
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name 
      user.image = auth.info.image
      user.location = auth.info.location 
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save! 
    end 
  end
  
end