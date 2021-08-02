require 'rails_helper'

RSpec.describe Roommate, type: :model do
  describe 'relationships' do
    it { should belong_to(:household).optional }
    it { should have_many(:assignments) }
    it { should have_many(:chores).through(:assignments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:google_id) }
    it { should validate_presence_of(:token) }
  end

  describe 'instance method' do
    before(:each) do 
      household = create(:mock_household)
      @user = create(:mock_roommate, household: household)
      @chore_1 = create(:mock_chore, household: household)
      @chore_2 = create(:mock_chore, household: household)
      @chore_3 = create(:mock_chore, household: household)
      assignment = create(:mock_assignment, roommate: @user, chore: @chore_1, completed: true)
      assignment_2 = create(:mock_assignment, roommate: @user, chore: @chore_2, completed: false)
    end

    describe '#incomplete_chores' do
      it 'returns list of all incomplete chores' do 

        expect(@user.incomplete_chores).to eq([@chore_2])
        expect(@user.completed_chores).to_not eq([@chore_3])
      end
    end

    describe '#completed_chores' do
      it 'returns lists of all completed chores' do 
        expect(@user.completed_chores).to eq([@chore_1])
        expect(@user.completed_chores).to_not eq([@chore_3])
      end
    end
  end
end
