class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  # Name will be required
  validates_presence_of :name 

  def first_name
    # self.name is referencing the name of the current user
    # split by default will split at space
    # first = 1st element in array created by split
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end

  # confirmable: user has to confirm they are person via email
  # lockable: can lock user out if they fail login after X num times
  # timeoutable: have ability to time out user if logged in over X  hours/days
  # omniauthable: integrate 3rd party logins (eg, log in thru Google)
  