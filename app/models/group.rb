class Group < ActiveRecord::Base
  
  has_many :memberships
  has_many :users, through: :memberships
  
  attr_accessible :about, :name

end
