class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]

  layout 'portfolio'

  # Index Action. Call Portfolio model & make available to view
  # thru @portfolio_items var.
  def index
    # Filter items so only items with angular subtitle appear
      # This uses the custom scope we created in Portfolio 
      # model file.
    #@portfolio_items = Portfolio.angular 
    # Filter to ruby on rails subtitle
    #@portfolio_items = Portfolio.ruby_on_rails_portfolio_items
    @portfolio_items = Portfolio.all
  end

  # Create custom angular method that filter by angular subtitle
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  # New Action - renders form to create new portfolio item.
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  # Create Action
  def create
    # Specify to Rails the params that we will allow thru
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  # Edit Action
  def edit
  end

  # Update Action
 def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # Show Action
  def show
  end

  # Destroy Action: delete record & then redirect user
  def destroy
    # Destroy/delete the record
    @portfolio_item.destroy

    # Redirect user after destroy occurs
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end

  # Methods underneath private are only to be used inside Portfolio Controller class
  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                     )
  end

  # Find given portfolio item
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
