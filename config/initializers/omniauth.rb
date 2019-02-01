Rails.application.config.middleware.use OmniAuth::Builder do
 provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET']
 
<<<<<<< HEAD
 provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], image_size: 'large'
=======
 provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
>>>>>>> Fixed navbar with profile pic, redesigned edit profile page, designed google and facebook buttons

end