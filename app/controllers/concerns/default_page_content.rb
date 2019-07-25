module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  # Change the page title (what appears in tab). This will be default
  # value. We can override value for each page/view in the correspondning
  # action within the controller.
  def set_page_defaults
    @page_title = "Devcamp Portfolio | My Portfolio Website"
    @seo_keywords = "Julia Martin portfolio"
  end
end