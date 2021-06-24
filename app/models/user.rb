class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false, presence: true }
  validates :password, length: { minimum: 3, presence: true }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.delete(' ').downcase)
    return user if user && user.authenticate(password)
    nil
  end
end
