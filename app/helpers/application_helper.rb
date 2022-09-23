module ApplicationHelper
  include Pagy::Frontend


  def full_title(page_title = '')
    base_title = 'Weather Widget'
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end
end
