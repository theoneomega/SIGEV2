class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id
  attr_accessible :active, :admin, :username, :role_ids, :analyst_number, :first_name, :last_name, :last_name2, :area, :department_id
  
  has_many :roles, :through => :assignments
  has_many :assignments
  belongs_to :department
  has_many :events
  has_many :eventfiles
end
