require 'rails_helper'

RSpec.describe "Assignment Update API" do
  before(:all) do
    @household = create(:mock_household)
    @chore = create(:mock_chore, household: @household)
    @roommate = create(:mock_roommate, household: @household)
    @assignment = Assignment.create(completed: false, roommate_id: @roommate.id, chore_id: @chore.id)
  end

  context 'happy paths' do
    it 'returns updated information' do
      patch "/api/v1/assignments/#{@assignment.id}", params: {
        assignment: {
          completed: true,
          roommate_id: @roommate.id,
          chore_id: @chore.id
        }
      }
      updated = Assignment.find_by(id: @assignment.id)

      expect(response).to be_successful
      expect(updated.completed).to eq(true)
    end
  end

  context 'happy paths' do
    it 'sad path: cannot update assignment that cannot be found' do
      id = 0
      patch "/api/v1/assignments/#{id}", params: {
        assignment: {
          completed: true,
          roommate_id: @roommate.id,
          chore_id: @chore.id
        }
      }

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:message]).to eq 'Not Found'
      expect(body[:errors]).to include 'Could not find assignment with id#0'
      expect(response.status).to eq(404)
    end
  end
end
