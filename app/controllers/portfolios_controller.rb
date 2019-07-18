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

  # Edit Action
  def edit
    # Find portfolio item to edit (look in params/URL for ID).
    # This found item will be passed to view as @portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  # Update Action
  def update
    # Find portfolio item to update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

end
