class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true 
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password, presence: true, length: { minimum: 5}

  class << self
    def authenticate_with_credentials (email, password)
      email = email.strip
      user = User.find_by_email(email)
      if user && user.authenticate(password)
        user
      else
        nil
      end
    end
  end
end


