module SetSource
  # ActiveSupport is a module that allows for things like included
  extend ActiveSupport::Concern

  included do 
    before_action :set_source
  end

  def set_source
    # params[:q] is referring to the query string in url
    # session holds data transferred between server & browser
    session[:source] = params[:q] if params[:q]
  end
end