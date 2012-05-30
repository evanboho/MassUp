class Membership < ActiveRecord::Base
  
  belongs_to :group, :user
  
  attr_accessible :admin, :contact, :group_id, :user_id
end
