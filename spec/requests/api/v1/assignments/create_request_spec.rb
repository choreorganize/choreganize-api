require 'rails_helper'

RSpec.describe "Assignment create API" do
  before(:all) do
    Chore.destroy_all
    Roommate.destroy_all
    @household = create(:mock_household)
    @chore = create(:mock_chore, household: @household)
    @roommate = create(:mock_roommate, household: @household)
  end

  context 'happy paths' do
    it 'returns assignment information' do
      post '/api/v1/assignments', params: {
        assignment: {
          completed: false,
          roommate_id: @roommate.id,
          chore_id: @chore.id
        }
      }
      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body[:data]).to have_key(:id)
      expect(body[:data]).to have_key(:type)
      expect(body[:data][:type]).to eq('assignment')

      expect(body[:data]).to have_key(:attributes)
      expect(body[:data][:attributes][:completed]).to eq(false)
      expect(body[:data][:attributes][:roommate_id]).to eq(@roommate.id)
      expect(body[:data][:attributes][:chore_id]).to eq(@chore.id)
    end

    it 'adds something to data base' do

      test = Assignment.find_by(roommate_id: @roommate.id)
      expect(test).to eq(nil)

      post '/api/v1/assignments', params: {
        assignment: {
          completed: false,
          roommate_id: @roommate.id,
          chore_id: @chore.id
        }
      }

      test_2 = Assignment.find_by(roommate_id: @roommate.id)

      expect(test_2.class).to eq(Assignment)
    end
  end

  context 'sad paths' do
    describe 'invalid roommate' do
      describe 'No existing roommate' do
        it 'returns errors' do
          post '/api/v1/assignments', params: {
            assignment: {
              completed: false,
              roommate_id: 0,
              chore_id: @chore.id
            }
          }
          body = JSON.parse(response.body, symbolize_names: true)

          expect(response.status).to eq(400)

          expect(body[:data]).to have_key(:message)
          expect(body[:data]).to have_key(:errors)
          expect(body[:data][:message]).to eq("your query could not be completed")
          expect(body[:data][:errors]).to eq('cannot create assignment')
        end
        it 'does not add anything to the data base' do

          test = Assignment.find_by(roommate_id: 0)
          expect(test).to eq(nil)

          post '/api/v1/assignments', params: {
            assignment: {
              completed: false,
              roommate_id: 0,
              chore_id: @chore.id
            }
          }

          test_2 = Assignment.find_by(roommate_id: 0)

          expect(test_2.class).to eq(NilClass)
        end
      end
    end
    describe 'invalid chore' do
      it 'returns errors' do
        post '/api/v1/assignments', params: {
          assignment: {
            completed: false,
            roommate_id: @roommate.id,
            chore_id: 0
          }
        }
        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(400)

        expect(body[:data]).to have_key(:message)
        expect(body[:data]).to have_key(:errors)
        expect(body[:data][:message]).to eq("your query could not be completed")
        expect(body[:data][:errors]).to eq('cannot create assignment')
      end
      it 'does not add anything to the data base' do

        test = Assignment.find_by(roommate_id: @roommate.id)
        expect(test).to eq(nil)

        post '/api/v1/assignments', params: {
          assignment: {
            completed: false,
            roommate_id: @roommate.id,
            chore_id: 0
          }
        }

        test_2 = Assignment.find_by(roommate_id: @roommate.id)

        expect(test_2.class).to eq(NilClass)
      end
    end
  end
end
