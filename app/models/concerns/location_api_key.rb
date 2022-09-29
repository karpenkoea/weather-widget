module LocationApiKey
  attr_accessor :api_key, :location_key

  def set_keys(city)
    self.api_key = Rails.application.credentials.api_key
    response = Faraday.get("http://dataservice.accuweather.com/locations/v1/cities/search?apikey=#{self.api_key}&q=#{city}")

    city_data = JSON.parse(response.body)
    self.location_key = city_data[0]['Key']
  end
end
