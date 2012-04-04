OmniAuth.config.full_host = "http://localhost:3000"

Rails.application.config.middleware.use OmniAuth::Builder do
  # OAuth 1.0 result # Access token starts with 1/xxxx
  # Provider	    Uid	                 Access  Token	                               Secret
  # google	raygao@are4.us	1/---------------------------------------------	    K88Rh8KjxZ8f_4jCIRFMOpRy
  provider :google, 'are4.us', '<oauth 1 secret>', :scope => 'http://gdata.youtube.com'

  # OAuth 2.0 result, # Access token starts with ya29.xxxx
  # https://code.google.com/apis/console/b/0/?pli=1#project:493990380024:access
  # See https://github.com/zquestz/omniauth-google-oauth2/issues/20    This explain OAuth2 for Google.
  # Note, OAuth, does not return token_secret,
  #
  # Provider	    Uid	                 Access  Token	                                               Secret
  #google_oauth2	102425343454127939656	ya29.---------------------------------------------------		 <none>
  provider :google_oauth2, '493990380024.apps.googleusercontent.com', '<oauth 2.0 secret>', {:access_type => 'online', :approval_prompt => '', :client_id => 'are4.us'}
end