require 'rails_helper'

RSpec.describe "Chore API" do
  before(:all) do
    @household = create(:mock_household)
    Chore.destroy_all
  end

  context 'Chore index' do
    it 'happy path: shows all chores in household' do
      create_list(:mock_chore, 3, household: @household)
      get '/api/v1/chores'

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body[:data].count).to eq(3)
    end
  end

  context 'Chore show' do
    it 'happy path: can find a single chore by id' do
      create_list(:mock_chore, 3, household: @household)
      chore = Chore.first
      get "/api/v1/chores/#{chore.id}"

      body = JSON.parse(response.body, symbolize_names: true)
   
      expect(body[:data][:id]).to eq("#{chore.id}")
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
  context 'Users create'
    it 'happy path: can create a new user'
    it 'sad path: cannot create user without all params'
end
