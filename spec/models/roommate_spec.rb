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
end
