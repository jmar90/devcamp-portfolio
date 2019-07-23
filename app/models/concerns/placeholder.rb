module Placeholder
  extend ActiveSupport::Concern

  # Create a method to generate image url
  def self.image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end
end