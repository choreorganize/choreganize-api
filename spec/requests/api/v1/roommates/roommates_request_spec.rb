require 'rails_helper'


RSpec.describe "Roommate API" do
  before(:all) do
    @household = create(:mock_household)
    Roommate.destroy_all
  end

  context 'Roommate index' do
    it 'happy path: sends all roomates in household' do
      create_list(:mock_roommate, 3, household: @household)
      get '/api/v1/roommates'


      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body[:data].count).to eq(3)
    end
  end

  context 'Roommate show' do
    it 'happy path: can find a single roommate by user id' do
      create_list(:mock_roommate, 3, household: @household)
      user = Roommate.first
      get "/api/v1/roommates/#{user.id}"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:data][:id]).to eq("#{user.id}")
      expect(body[:data]).to have_key(:type)
      expect(body[:data]).to have_key(:attributes)
      expect(body[:data][:attributes][:name]).to eq(user.name)
      expect(body[:data][:attributes][:household_id]).to eq(@household.id)
      expect(body[:data][:attributes][:email]).to eq(user.email)
      expect(body[:data][:attributes][:google_id]).to eq(user.google_id)
      expect(body[:data][:attributes][:token]).to eq(user.token)
    end

    it 'sad path: cannot find the user' do
      create_list(:mock_roommate, 3, household: @household)
      user_id = 0
      get "/api/v1/roommates/#{user_id}"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:message]).to eq 'Not Found'
      expect(body[:errors]).to include 'Could not find user with id#0'
      expect(response.status).to eq(404)
    end
  end
  context 'Users create' do
    it 'happy path: can create a new user' do

    end
    it 'sad path: cannot create user without all params'
  end
end