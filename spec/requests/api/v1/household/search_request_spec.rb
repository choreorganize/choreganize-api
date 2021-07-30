require 'rails_helper'

RSpec.describe "Household search  API" do
  before(:all) do
    @household = create(:mock_household)
  end

  context 'happy paths' do
    it ' sends info on household' do

      get "/api/v1/household/search", params: {
        search_terms: {
          address: @household.address,
          city: @household.city,
          state: @household.state
          }
        }

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

      expect(body[:data][:attributes]).to_not have_key(:housecode_digest)
      expect(body[:data][:attributes][:housecode_digest]).to_not eq(@household.housecode_digest)
      expect(body[:data][:attributes][:housecode_digest]).to eq(nil)
    end
  end

  context 'sad paths' do
    it ' invalid city ' do

    end

    it ' invalid address  ' do

    end

    it ' invalid state  ' do

    end

  end
end
