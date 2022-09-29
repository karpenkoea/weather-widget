require 'faraday'
require 'json'
# Fields description start
# city: string
# current_temperature: string
# max_temp: string
# min_temp: string
# avg_temp: string
# timezone: string
# hourly_temperatures: text (Array) (Default: [])
# Fields description end
class Weather < ApplicationRecord
  extend LocationApiKey
  before_create :set_data

  class << self
    def get_weather(city)
      # set_keys(city)
      # # find city by :location_key
      # if location_key.present?
      #   city_by_location_key = Faraday.get("http://dataservice.accuweather.com/currentconditions/v1/#{self.location_key}?apikey=#{self.api_key}")
      #   data = JSON.parse(city_by_location_key.body)
      # end
      data = [{"LocalObservationDateTime"=>"2022-09-29T13:53:00+03:00", "EpochTime"=>1664448780, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>9.3, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>49.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}]
    end

    def get_historical_weather(city)
      # set_keys(city)
      # #  find city by locationKey
      # if location_key.present?
      #   city_by_location_key = Faraday.get("http://dataservice.accuweather.com/currentconditions/v1/#{self.location_key}/historical/24?apikey=#{self.api_key}")
      #   data = JSON.parse(city_by_location_key.body)
      # end

      data = [{"LocalObservationDateTime"=>"2022-09-29T12:57:00+03:00", "EpochTime"=>1664445420, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>9.3, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>49.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T11:57:00+03:00", "EpochTime"=>1664441820, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>10.7, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>51.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T10:57:00+03:00", "EpochTime"=>1664438220, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>9.8, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>50.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T10:04:00+03:00", "EpochTime"=>1664435040, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>9.8, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>50.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T09:00:00+03:00", "EpochTime"=>1664431200, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>10.1, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>50.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T07:58:00+03:00", "EpochTime"=>1664427480, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>9.2, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>49.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T06:53:00+03:00", "EpochTime"=>1664423580, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>7.8, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>46.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T05:59:00+03:00", "EpochTime"=>1664420340, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>7.6, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>46.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T04:58:00+03:00", "EpochTime"=>1664416680, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>7.1, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>45.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T03:59:00+03:00", "EpochTime"=>1664413140, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>7.1, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>45.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T02:58:00+03:00", "EpochTime"=>1664409480, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>4.7, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>41.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T01:58:00+03:00", "EpochTime"=>1664405880, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>5.0, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>41.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-29T00:58:00+03:00", "EpochTime"=>1664402280, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>5.3, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>42.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T23:59:00+03:00", "EpochTime"=>1664398740, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>6.7, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>44.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T23:05:00+03:00", "EpochTime"=>1664395500, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>6.7, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>44.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T21:59:00+03:00", "EpochTime"=>1664391540, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>5.4, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>42.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T20:58:00+03:00", "EpochTime"=>1664387880, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>4.7, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>40.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T19:58:00+03:00", "EpochTime"=>1664384280, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>3.9, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>39.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T18:58:00+03:00", "EpochTime"=>1664380680, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>2.6, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>37.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T17:58:00+03:00", "EpochTime"=>1664377080, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>false, "Temperature"=>{"Metric"=>{"Value"=>3.7, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>39.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T17:06:00+03:00", "EpochTime"=>1664373960, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>3.7, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>39.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T15:58:00+03:00", "EpochTime"=>1664369880, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>2.1, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>36.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T14:59:00+03:00", "EpochTime"=>1664366340, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>3.7, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>39.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}, {"LocalObservationDateTime"=>"2022-09-28T14:05:00+03:00", "EpochTime"=>1664363100, "WeatherText"=>"Cloudy", "WeatherIcon"=>7, "HasPrecipitation"=>false, "PrecipitationType"=>nil, "IsDayTime"=>true, "Temperature"=>{"Metric"=>{"Value"=>3.7, "Unit"=>"C", "UnitType"=>17}, "Imperial"=>{"Value"=>39.0, "Unit"=>"F", "UnitType"=>18}}, "MobileLink"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us", "Link"=>"http://www.accuweather.com/en/ru/kazan/295954/current-weather/295954?lang=en-us"}]
    end
  end

  private

  def set_data
    data = Weather.get_weather(city)
    historical_data = Weather.get_historical_weather(city)

    self.city = city
    self.current_temperature = data[0]["Temperature"]["Metric"]["Value"].round
    self.max_temp = historical_max(data)
    self.min_temp = historical_min(data)
    self.avg_temp = historical_avg(data)
  end


  def historical_max(data)
    data.map { |el| el["Temperature"]["Metric"]["Value"].round }.max
  end

  def historical_min(data)
    data.map { |el| el["Temperature"]["Metric"]["Value"].round }.max
  end

  def historical_avg(data)
    temps = data.map { |el| el["Temperature"]["Metric"]["Value"].round }
    self.avg_temp = (temps.inject(0.0) { |sum, el| sum + el } / temps.size).round
  end
end
