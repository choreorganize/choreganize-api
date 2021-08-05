require 'rails_helper'

RSpec.describe Household, type: :model do
  describe 'relationships' do
    it { should have_many(:chores), dependent: :destroy }
    it { should have_many(:roommates), dependent: :destroy }
  end

  describe 'validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:password_digest) }
  end

  describe '#weather_forecast' do
    it 'returns weather forecast' do
      household = create(:mock_household)

      expect(household.weather_forecast).to be_a(ForecastDetails)
    end
  end
end
