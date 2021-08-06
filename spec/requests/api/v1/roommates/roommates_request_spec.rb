require 'rails_helper'

RSpec.describe "Roommate API" do
  before(:all) do
    @household = create(:mock_household)
    Roommate.destroy_all
  end

  context 'Roommate index' do
    xit 'happy path: sends all roomates in household' do
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
      chore_1 = create(:mock_chore, household: @household)
      chore_2 = create(:mock_chore, household: @household)
      chore_3 = create(:mock_chore, household: @household)
      assignment = create(:mock_assignment, roommate: user, chore: chore_1, completed: true)
      assignment_2 = create(:mock_assignment, roommate: user, chore: chore_2, completed: false)

      get "/api/v1/roommates/#{user.id}"

      body = JSON.parse(response.body, symbolize_names: true)[:data]
      # require 'pry'; binding.pry
      expect(body[:id]).to eq("#{user.id}")
      expect(body).to have_key(:type)
      expect(body[:type]).to eq("google_user")
      expect(body).to have_key(:attributes)
      expect(body[:attributes][:name]).to eq(user.name)
      expect(body[:attributes][:email]).to eq(user.email)
      expect(body[:attributes][:google_id]).to eq(user.google_id)
      expect(body[:attributes][:token]).to eq(user.token)

      expect(body[:attributes][:household][:id]).to eq(@household.id)
      expect(body[:attributes][:household][:address]).to eq(@household.address)
      expect(body[:attributes][:household][:password_digest]).to eq(@household.password_digest)
      expect(body[:attributes][:household][:city]).to eq(@household.city)
      expect(body[:attributes][:household][:state]).to eq(@household.state)
      
      expect(body[:attributes][:incomplete_chores]).to be_a(Array)
      expect(body[:attributes][:incomplete_chores].count).to eq(1)
      expect(body[:attributes][:incomplete_chores].first[:id]).to eq(chore_2.id)
      expect(body[:attributes][:incomplete_chores].first[:household_id]).to eq(chore_2.household_id)
      expect(body[:attributes][:incomplete_chores].first[:task_name]).to eq(chore_2.task_name)
      expect(body[:attributes][:incomplete_chores].first[:description]).to eq(chore_2.description)
      expect(body[:attributes][:incomplete_chores].first[:weight]).to eq(chore_2.weight)
      expect(body[:attributes][:incomplete_chores].first[:frequency]).to eq(chore_2.frequency)
      expect(body[:attributes][:incomplete_chores].first[:outdoor]).to eq(chore_2.outdoor)

      expect(body[:attributes][:completed_chores]).to be_a(Array)
      expect(body[:attributes][:completed_chores].count).to eq(1)      
      expect(body[:attributes][:completed_chores].first[:id]).to eq(chore_1.id)
      expect(body[:attributes][:completed_chores].first[:household_id]).to eq(chore_1.household_id)
      expect(body[:attributes][:completed_chores].first[:task_name]).to eq(chore_1.task_name)
      expect(body[:attributes][:completed_chores].first[:description]).to eq(chore_1.description)
      expect(body[:attributes][:completed_chores].first[:weight]).to eq(chore_1.weight)
      expect(body[:attributes][:completed_chores].first[:frequency]).to eq(chore_1.frequency)
      expect(body[:attributes][:completed_chores].first[:outdoor]).to eq(chore_1.outdoor)
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

      patch "/api/v1/roommates/#{id}", params: { 
        roommate: {
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
      patch "/api/v1/roommates/#{id}", params: { 
        roommate: {
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
