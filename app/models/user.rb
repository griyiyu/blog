class User < ActiveRecord::Base
  attr_accessible :email, :password_hash
  attr_accessor :password
  
  before_save :encrypt_password
  
  validates_presence_of :password_hash, :on => :create
  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == Digest::MD5.digest(user_params[:password_hash]).force_encoding("utf-8") 
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_hash = Digest::MD5.digest(user_params[:password_hash]).force_encoding("utf-8") 
    end
  end
  
end
