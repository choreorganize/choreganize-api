require 'rails_helper'

RSpec.describe Roommate, type: :model do
  describe 'relationships' do
    it { should belong_to(:household) }
    it { should have_many(:assignments) }
    it { should have_many(:chores).through(:assignments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_numericality_of(:user_id) }
  end
end
