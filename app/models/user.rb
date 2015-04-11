class User < ActiveRecord::Base

 
has_many :comments

has_many :memberships, dependent: :destroy
has_many :projects, through: :memberships


  has_secure_password

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create


   def fullname
    "#{first_name} #{last_name}"
  end 

  def user_count
    if users.count == 1
      "#{users.count} User"
    else
      "#{users.count} Users"
    end
  end 


  def owner?(project)
    self.memberships.where(role: 0).map(&:project).include?(project)
  end

  def member?(project)
    self.memberships.where(role: 1).map(&:project).include?(project)
  end


end 



	


