class User < ActiveRecord::Base
  require 'bcrypt'

  validates :email, presence: true, uniqueness: true, case_sensitive: false 
  validates :password, presence: true

  has_secure_password 
	has_many :rounds
	has_many :guesses, through: :rounds 
end
