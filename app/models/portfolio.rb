class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Class method for defining scope. self - referencing particular 
    # portfolio item when it's called
  def self.angular
    where(subtitle: "Angular")
  end

  # Another method to define scope (use scope keyword)
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }
end
