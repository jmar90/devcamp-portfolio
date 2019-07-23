class Topic < ApplicationRecord
  validates_presence_of :title

  # Indicate that many blogs are associated with a given topic
  has_many :blogs
end
