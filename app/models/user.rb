class User < ActiveRecord::Base
  
  def self.authenticate(user_name, password)
    where(user_name: user_name, password: password).first
  end
  
end
