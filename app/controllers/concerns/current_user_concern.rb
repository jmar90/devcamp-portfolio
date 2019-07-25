module CurrentUserConcern
  extend ActiveSupport::Concern

  # Override current_user method. Want it available even 
  # when no user is logged in (currently only available to 
  # Devise users)
  def current_user
    # Super - don't change anything; I want same behavior as in
      # method we are overwriting.
    # If super is true (someone is logged in, then run the original 
      # current_user method). Right side of || = null object pattern.
      # Right side only runs if someone isn't logged in & will return
      # a value for guest user.
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User", 
                  first_name: "Guest", 
                  last_name: "User", 
                  email: "guest@example.com"
                  )
  end
end