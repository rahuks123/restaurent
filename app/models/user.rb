class User < ActiveRecord::Base
  has_secure_password

  def self.position
    User.all
  end
end
