class User < ActiveRecord::Base
	has_secure_password
	
	validates :name, presence: true, length: {maximum: 30}, uniqueness: true
  	validates :email, presence: true, uniqueness: true
	validates :password, presence: true
end
