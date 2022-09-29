class WeathersController < ApplicationController
  def create
    # render plain: params

    #
    @weather = Weather.new weather_params

    if @weather.save
      redirect_to weather_index_path
    else
      render :index
    end

  end

  def index
    # @response = Weather.get_weather('Kazan')
    @weather = Weather.new
    @weathers = Weather.all
  end

  private

  def weather_params
    params.require(:weather).permit(
      :city,
      :current_temperature,
      :max_temp,
      :min_temp,
      :avg_temp,
      :timezone,
      :hourly_temperatures)
  end
end
