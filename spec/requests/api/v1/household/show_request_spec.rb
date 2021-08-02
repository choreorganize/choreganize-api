require 'rails_helper'

RSpec.describe "Household Show page API" do
  before(:all) do
    @household = create(:mock_household)
  end

  context 'happy paths' do
    it ' sends info on household' do

      get "/api/v1/household/#{@household.id}"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(body[:data]).to have_key(:id)
      expect(body[:data][:id]).to eq("#{@household.id}")
      expect(body[:data]).to have_key(:type)
      expect(body[:data][:type]).to eq('households')

      expect(body[:data]).to have_key(:attributes)
      expect(body[:data][:attributes][:address]).to eq(@household.address)
      expect(body[:data][:attributes][:city]).to eq(@household.city)
      expect(body[:data][:attributes][:state]).to eq(@household.state)

      expect(body[:data][:attributes]).to_not have_key(:password_digest)
      expect(body[:data][:attributes][:password_digest]).to_not eq(@household.password_digest)
      expect(body[:data][:attributes][:password_digest]).to eq(nil)
      
      expect(body[:data][:attributes]).to have_key(:weather_forecast)
      expect(body[:data][:attributes][:weather_forecast]).to have_key(:current_weather)
      expect(body[:data][:attributes][:weather_forecast][:current_weather]).to be_a(Hash)
      expect(body[:data][:attributes][:weather_forecast]).to have_key(:daily_weather)
      expect(body[:data][:attributes][:weather_forecast][:daily_weather]).to be_a(Array)
      expect(body[:data][:attributes][:weather_forecast][:daily_weather].count).to eq(5)  
    end

    it ' can send info on roommates and ' do

      get "/api/v1/household/#{@household.id}"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(body[:data]).to have_key(:id)
      expect(body[:data][:id]).to eq("#{@household.id}")
      expect(body[:data]).to have_key(:type)
      expect(body[:data][:type]).to eq('households')

      expect(body[:data][:attributes]).to have_key(:chores)
      expect(body[:data][:attributes][:chores].class).to eq(Array)

      expect(body[:data][:attributes]).to have_key(:roommates)
      expect(body[:data][:attributes][:roommates].class).to eq(Array)
    end
  end

  context 'sad paths' do
    it ' responds appropriatly when the household does not exist' do

      get "/api/v1/household/#{@household.id+100}"
      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)

      expect(body[:data]).to have_key(:message)
      expect(body[:data][:message]).to eq("your query could not be completed")
      expect(body[:data]).to have_key(:errors)
      expect(body[:data][:errors]).to eq("cannot find household with id #{@household.id+100}")
    end
  end
end
