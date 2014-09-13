class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 30}, uniqueness: true
  validates :email, presence: true, uniqueness: true
	validates :password, presence: true
end
