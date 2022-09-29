module ApplicationHelper
  include Pagy::Frontend

  def nav_tab(title, url, options = {})
    current_page = options.delete :current_page
    css_class = options[:class].presence || ''
    options[:class] = current_page == title ? "#{css_class} active" : css_class
    link_to title, url, options
  end

  def currently_at(current_page = '')
    render partial: 'shared/header', locals: { current_page: current_page }
  end

  def full_title(page_title = '')
    base_title = 'Weather Widget'
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end
end
