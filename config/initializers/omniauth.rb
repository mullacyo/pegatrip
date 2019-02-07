Rails.application.config.middleware.use OmniAuth::Builder do
 provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET']
  { access_type: "offline", 
    prompt: "select_account consent",
    select_account: true,
    scope: 'userinfo.profile,userinfo.email,calendar', 
  	provider_ignores_state: false,
  	domain: 'http://localhost:3000/'}
 
 provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']#, scope: ‘public_profile’

end