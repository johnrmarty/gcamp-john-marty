class User < ActiveRecord::Base

  def fullname
    "#{first_name} #{last_name}"
  end 

    has_secure_password

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true 

end 
