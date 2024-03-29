class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {:case_sensitive => false}, allow_nil: false
  validates :password, presence: true, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    authUser = User.where('lower(email) = ?', email.strip.downcase).first
    if (authUser && authUser.authenticate(password))
      authUser
    else 
      nil
    end
  end

end
