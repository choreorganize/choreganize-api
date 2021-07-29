require 'rails_helper'

RSpec.describe Household, type: :model do
  describe 'relationships' do
    it { should have_many(:chores) }
    it { should have_many(:roommates) }
  end

  describe 'validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:housecode_digest) }
  end
end
