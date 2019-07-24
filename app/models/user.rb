class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
end

  # confirmable: user has to confirm they are person via email
  # lockable: can lock user out if they fail login after X num times
  # timeoutable: have ability to time out user if logged in over X  hours/days
  # omniauthable: integrate 3rd party logins (eg, log in thru Google)
  