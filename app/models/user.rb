class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def self.authenticate_with_credentials(email, password)
    email = email.lstrip
    user = User.find_by_email(email.downcase)
    if user && user.authenticate(password)
      return user
    end
    return nil
  end
end
# .retrip