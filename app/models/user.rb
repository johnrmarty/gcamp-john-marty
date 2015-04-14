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


  


   def project_owner?(project)
    project.memberships.find_by(role: Membership.roles[:owner], user_id: id)
    end

    def project_member?(project)
    project.memberships.find_by(role: Membership.roles[:member], user_id: id)
    end

    def last_project_owner?(project)
    project.memberships.where(role: Membership.roles[:owner]).count == 1 && project_owner?(project)
    end



end 



	


