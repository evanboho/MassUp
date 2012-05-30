class User < ActiveRecord::Base
  
  has_many :authentications,  :dependent => :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  
  validates :email, :username, :presence => true
end
