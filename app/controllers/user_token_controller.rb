class UserTokenController < Knock::AuthTokenController
  #had to comment this out to create an auth token
  skip_before_action :verify_authenticity_token
end
