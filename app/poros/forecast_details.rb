class ForecastDetails 
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(details)
    @id = details[:id] 
    @current_weather = get_current_weather(details[:current])
    @daily_weather = get_daily_weather(details[:daily][0..4])
  end

  private
    def get_current_weather(data)
      {
        datetime: Time.at(data[:dt]).to_s(:dt),
        sunrise: Time.at(data[:sunrise]).to_s(:time),
        sunset: Time.at(data[:sunset]).to_s(:time),
        temperature: data[:temp],
        feels_like: data[:feels_like],
        humidity: data[:humidity],
        uvi: data[:uvi],
        visibility: data[:visibility],
        conditions: data[:weather][0][:description],
        icon: data[:weather][0][:icon]
      }
    end

    def get_daily_weather(data)
      data.map do |data|
        {
          date: Time.at(data[:dt]).to_date,
          sunrise: Time.at(data[:sunrise]).to_s(:time),
          sunset: Time.at(data[:sunset]).to_s(:time),
          max_temp: data[:temp][:max],
          min_temp: data[:temp][:min],
          conditions: data[:weather][0][:description],
          icon: data[:weather][0][:icon]
        }
      end
    end
end