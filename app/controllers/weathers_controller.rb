class WeathersController < ApplicationController
  def index
    @response = Weather.get_weather('Kazan')
  end
end
