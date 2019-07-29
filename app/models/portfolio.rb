class Portfolio < ApplicationRecord
  has_many :technologies

  # Will allow us to create single portfolio item & then slide
    # in multiple technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumb_image

  # Class method for defining scope. self - referencing particular 
    # portfolio item when it's called (like 'this' in JS)
  def self.angular
    where(subtitle: "Angular")
  end

  def self.by_position
    order("position ASC")
  end

  # Another method to define scope (use scope keyword)
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }

  # After portfolio item has been initialized (when new action
    # has been called), set default value
  after_initialize :set_defaults

  # If we just did =, these defaults would overwrite existing 
    # images. 
  # ||= is a shortcut for the following code:
    # if self.main_image == nil
    #   self.main_image = "http://placehold.it/600x400"
    # end
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
