module ApplicationHelper
  include Pagy::Frontend

  def currently_at(current_page = '')
    render partial: 'shared/header', locals: { current_page: current_page }
  end

  def full_title(page_title = '')
    base_title = 'Weather Widget'
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end
end
