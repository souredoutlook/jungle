class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  
  has_secure_password
  
end
