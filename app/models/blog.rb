class Blog < ApplicationRecord
	enum status: { draft: 0, published: 1 }
  extend FriendlyId
	friendly_id :title, use: :slugged

  # Do not allow blog post to be created unless both title & body
    # are filled out.
  validates_presence_of :title, :body

  # Indicate that blog belongs to topic
  belongs_to :topic, optional: true
end
