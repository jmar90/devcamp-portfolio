class PortfoliosController < ApplicationController

  # Index Action. Call Portfolio model & make available to view
  # thru @portfolio_items var.
  def index
    @portfolio_items = Portfolio.all 
  end

end
