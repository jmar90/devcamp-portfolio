# This will whitelist the name parameter for devise (currently,
    # it is not whitelisted & is not being saved to db)
module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    # Whitelist name for register route (devise refers to it as sign_up)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # Whitelist name for register edit route
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end