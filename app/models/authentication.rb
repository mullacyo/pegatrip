class Authentication < ApplicationRecord
  belongs_to :user


validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  

  def self.create_with_omniauth(auth_hash)
    self.new(
      provider: auth_hash["provider"],
      uid: auth_hash["uid"],
      token: auth_hash["credentials"]["token"]
    )
  end

  def update_token(auth_hash)
    self.token = auth_hash["credentials"]["token"]
    self.save
  end


end
