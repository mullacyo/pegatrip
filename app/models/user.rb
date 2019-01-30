class User < ApplicationRecord
  include Clearance::User

has_many  :trips, dependent: :destroy


mount_uploader :avatar, AvatarUploader
end
