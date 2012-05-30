module UsersHelper
  
  def photo(user)
    u = user.authentications.order("updated_at DESC").first
    u.photo_url
  end


end