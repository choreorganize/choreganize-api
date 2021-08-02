class OpenWeatherService

  def self.get_forecast_data(coordinates)
    new.request_api("/data/2.5/onecall?lat=#{coordinates[:lat]}&lon=#{coordinates[:lng]}&exclude=minutely,hourly,alerts")
  end

  def request_api(path)
    resp = conn("https://api.openweathermap.org/").get(path) do |faraday|
      faraday.params['appid'] = ENV['openweather_key']
    end 

    parse_json(resp)
  end


  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true) 
  end

  def conn(url)
    Faraday.new(url)
  end
end