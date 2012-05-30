class User < ActiveRecord::Base
  
  has_many :authentications,  :dependent => :destroy
  has_many :memberships
  has_many :groups, through: :memberships
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  
  validates :email, :username, :presence => true

  
  private
  
  def self.find_or_create(auth)
    if user = User.find_by_email(auth[:email])
      return user
    elsif auth[:email].present?
      username = auth[:username] ||= auth[:name].split(' ').first + rand(9).to_s + rand(9).to_s
      user = User.create(:email => auth[:email], :username => username, :password => Devise.friendly_token[0,20])
    else 
      return nil
    end  
  end
  
end
