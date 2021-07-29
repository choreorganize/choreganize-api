require 'rails_helper'

RSpec.describe "User API" do
  before(:all) do
    @household = create(:mock_household)
  end

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

  context 'Users create'
    it 'happy path: can create a new user'
    it 'sad path: cannot create user without all params'  
end