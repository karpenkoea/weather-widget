require 'net/http'
require 'json'

class Character < ApplicationRecord


  class << self
    # Retrieves the weather json
    def get_weather(name)
      api_key = Rails.application.credentials.api_key
      # TODO: Change units based on locale

      # uri = URI("http://api.accuweather.com/locations/v1/search?q=san&apikey=#{api_key}")
      # api_key = Rails.application.credentials.open_weather_map[:api_key]
      city = URI("http://dataservice.accuweather.com/locations/v1/cities/search?apikey=RJNeW5hXhw8QjZ04uWfgw6a1ax5C8e5G&q=#{name}")
      # Download and parse the JSON from the api
      res = JSON.parse(Net::HTTP.get(city))
      key = res[0]["Key"]

      info_by_city = URI("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{key}?apikey=#{api_key}")

      body = JSON.parse(Net::HTTP.get(info_by_city))
    
      # res.last
    end
  end
end
