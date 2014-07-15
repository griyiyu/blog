class User < ActiveRecord::Base

  before_save :encrypt_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == Digest::MD5.digest(password).force_encoding("utf-8") 
      user
    else
      nil
    end
  end

  def encrypt_password
    if self.password_hash
      self.password_hash = Digest::MD5.digest(self.password_hash).force_encoding("utf-8") 
    end
  end
  
end
