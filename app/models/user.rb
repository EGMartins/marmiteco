# Model for the user
class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true

  def self.auth(email, password)
    user = User.where(email: email).first
    user && user.authenticate(password) ? user : nil
  end
end
