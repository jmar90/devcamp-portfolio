class PortfoliosController < ApplicationController

  # Index Action. Call Portfolio model & make available to view
  # thru @portfolio_items var.
  def index
    @portfolio_items = Portfolio.all 
  end

  # New Action - renders form to create new portfolio item.
  def new
    @portfolio_item = Portfolio.new
  end

  # Create Action
  def create
    # Specify to Rails the params that we will allow thru
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
        # Redirect to portfolios_path (index pg) after saving
      else
        format.html { render :new }
      end
    end
  end

end
