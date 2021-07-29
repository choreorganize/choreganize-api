require 'rails_helper'

RSpec.describe "User API" do
  # before(:all) do
  #   @household = create(:mock_household)
  # end

  context 'User index' do
    it 'happy path: sends all users' do
      create_list(:mock_roommates, 3, household: @household)

      get '/api/v1/roommates'

      body = JSON.parse(response.body, symbolizes_names: true)

      expect(response).to be_successful
      expect(body[:data].size).to eq(3)
    end
  end

  context 'Users show'
    it 'happy path: can find a single user'
    it 'sad path: cannot find the user'

  context 'Users create' do
    it 'happy path: can create a new user' do

      post '/api/v1/roommates', params: {
        roommate: {
          name: 'Moe deGrasse Tyson',
          email: 'cutthatgrass@ex.com',
          google_id: '456',
          token: '1234567890'
        }
      }

      body = JSON.parse(response.body, symbolizes_names: true)
      # require 'pry'; binding.pry
      expect(response).to be_successful
    end
    it 'sad path: cannot create user without all params'
  end
end