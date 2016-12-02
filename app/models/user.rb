class User < ApplicationRecord
  has_many :tweets
  has_secure_password

  def admin?
    membership_type == "admin"
  end
end
