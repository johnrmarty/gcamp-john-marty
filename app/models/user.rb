class User < ActiveRecord::Base

  def fullname
    "#{first_name} #{last_name}"
  end 

has_many :comments

has_many :memberships, dependent: :destroy
has_many :projects, through: :memberships


  has_secure_password

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create


end 


