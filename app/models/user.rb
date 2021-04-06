class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true
  validates :password, length: {minimum: 8}
  validates :password_confirmation, presence: true
  
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user.authenticate(password)
      user
    else
      nil
    end
  end
  
end
