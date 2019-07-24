class ApplicationController < ActionController::Base
  # Moved whitelist code to controllers/concerns/devise_whitelist; just
    # use 'include DeviseWhitelist'

  # Run this before all other controller
  # This will whitelist the name parameter for devise (currently,
    # it is not whitelisted & is not being saved to db)
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   # Whitelist name for register route (devise refers to it as sign_up)
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #   # Whitelist name for register edit route
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  # end
  include DeviseWhitelist

  before_action :set_source

  def set_source
    # params[:q] is referring to the query string in url
    # session holds data transferred between server & browser
    session[:source] = params[:q] if params[:q]
  end
end
