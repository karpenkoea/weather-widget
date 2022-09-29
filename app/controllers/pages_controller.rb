class PagesController < ApplicationController
  def index
    @weather = Weather.new
  end
end
