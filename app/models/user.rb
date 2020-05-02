class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  def self.position
    User.all
  end
end
