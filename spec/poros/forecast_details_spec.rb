require "rails_helper"

RSpec.describe ForecastDetails do
  describe 'class methods' do
    describe '::forecast' do
      it 'creates forecast details object' do
        response = File.read('spec/fixtures/open_weather/forecast_details.json')
        forecast_details = JSON.parse(response, symbolize_names: true) 
    
        fd = ForecastDetails.new(forecast_details)
   
        expect(fd).to be_a(ForecastDetails)
        expect(fd.current_weather).to be_a(Hash)
        expect(fd.current_weather).to have_key(:datetime)
        expect(fd.current_weather).to have_key(:sunrise)
        expect(fd.current_weather).to have_key(:sunset)
        expect(fd.current_weather).to have_key(:temperature)
        expect(fd.current_weather).to have_key(:feels_like)
        expect(fd.current_weather).to have_key(:humidity)
        expect(fd.current_weather).to have_key(:uvi)
        expect(fd.current_weather).to have_key(:visibility)
        expect(fd.current_weather).to have_key(:conditions)
        expect(fd.current_weather).to have_key(:icon)

        expect(fd.daily_weather).to be_a(Array)
        expect(fd.daily_weather.count).to eq(5)
        expect(fd.daily_weather.first).to be_a(Hash)
        expect(fd.daily_weather.first).to have_key(:date)
        expect(fd.daily_weather.first).to have_key(:sunrise)
        expect(fd.daily_weather.first).to have_key(:sunset)
        expect(fd.daily_weather.first).to have_key(:max_temp)
        expect(fd.daily_weather.first).to have_key(:min_temp)
        expect(fd.daily_weather.first).to have_key(:conditions)
        expect(fd.daily_weather.first).to have_key(:icon)
      end
    end
  end
end