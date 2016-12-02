class User < ApplicationRecord
  has_many :tweets
  has_secure_password

  def author?
    membership_type == "author"
  end

  def member?
    membership_type == "member"
  end
  
end
