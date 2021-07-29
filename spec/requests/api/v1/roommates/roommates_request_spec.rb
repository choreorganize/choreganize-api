require 'rails_helper'

RSpec.describe "Roommate API" do
  before(:all) do
    @household = create(:mock_household)
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

  context 'Roommate show'
    it 'happy path: can find a single user'
    it 'sad path: cannot find the user'

  context 'Users create'
    it 'happy path: can create a new user'
    it 'sad path: cannot create user without all params'  
end