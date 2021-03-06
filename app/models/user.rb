class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  has_many :goals
  
  attr_accessor :password
  attr_accessible :photo, :phone, :first_name, :last_name, :email
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/userimage/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/userimage/:id/:style/:basename.:extension"
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
