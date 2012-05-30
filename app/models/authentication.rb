class Authentication < ActiveRecord::Base
  attr_accessible :nickname, :photo_url, :provider, :uid, :user_id
  
  private
  
  def self.find_or_create(auth, user)
    unless authentication = Authentication.find_by_user_id(user.id)
      user.authentications.create!(:provider => auth[:provider], :uid => auth[:uid], :photo_url => auth[:photo_url])  
    else
      authentication.update_attributes(:photo_url => auth[:photo_url])
    end
  end
  
  
end
