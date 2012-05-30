class Authentication < ActiveRecord::Base
  attr_accessible :nickname, :photo_url, :provider, :uid, :user_id
end
