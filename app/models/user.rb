class User < ApplicationRecord
  include Clearance::User

has_many  :trips, dependent: :destroy

has_many :authentications, dependent: :destroy

mount_uploader :avatar, AvatarUploader

 def self.create_with_auth_and_hash(authentication, auth_hash)

    user = nil
    if auth_hash[:provider] == 'facebook'
      x = auth_hash["info"]["name"].split(" ")

       user = self.create!(
         first_name: x.shift, 
         last_name: x.join(" "),
         email: auth_hash["info"]["email"],
        
         password: SecureRandom.hex(10)
       )
         user.remote_avatar_url = auth_hash["info"]["image"]
         user.save
    else 
       user = self.create!(
         first_name: auth_hash["info"]["first_name"],
         last_name: auth_hash["info"]["last_name"],
         
         email: auth_hash["info"]["email"],
         
         password: SecureRandom.hex(10)
       )
       user.remote_avatar_url = auth_hash["info"]["image"]
       user.save
    end
   user.authentications << authentication
   return user

 end

 # grab google to access google for user data
 def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
 end

def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end





end


