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
  context 'Roommate create' do
    it 'happy path: can create a new roommate' do
      post '/api/v1/roommates', params: {
        roommate: {
          name: 'Moe deGrasse Tyson',
          email: 'cutthatgrass@ex.com',
          google_id: '456',
          token: '1234567890'
        }
      }
      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body[:data]).to have_key(:type)
      expect(body[:data]).to have_key(:attributes)
      expect(body[:data][:attributes][:name]).to eq('Moe deGrasse Tyson')
      expect(body[:data][:attributes][:household_id]).to eq(nil)
      expect(body[:data][:attributes][:email]).to eq('cutthatgrass@ex.com')
      expect(body[:data][:attributes][:google_id]).to eq('456')
      expect(body[:data][:attributes][:token]).to eq('1234567890')
    end
    it 'sad path: cannot create user without all params' do
      post '/api/v1/roommates', params: {
        roommate: {
          name: 'Moe deGrasse Tyson',
          google_id: '456',
          token: '1234567890'
        }
      }
      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:email]).to eq(["can't be blank"])
    end
  end
  context 'Roommate update' do
    it 'happy path: can update an existing roommate' do
      id = create(:mock_roommate, household: @household).id
      previous = Roommate.last.name 

      patch "/api/v1/roommates/#{id}", params: { roommate: {
            name: "updated",
            household_id: @household.id
          }
      }

      updated = Roommate.find_by(id: id)

      expect(response).to be_successful
      expect(updated.name).to_not eq(previous)
      expect(updated.name).to eq("updated")
      expect(updated.household_id).to eq(@household.id)
    end

    it 'sad path: cannot update roommate that cannot be found' do 
      id = 0
      patch "/api/v1/roommates/#{id}", params: { roommate: {
            name: "updated",
            household_id: @household.id
          }
      }

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:message]).to eq 'Not Found'
      expect(body[:errors]).to include 'Could not find roommate with id#0'
      expect(response.status).to eq(404)
    end
  end
end
