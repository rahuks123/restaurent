class User < ApplicationRecord
  has_secure_password
  has_many :orders

  def self.position
    User.all
  end
end
