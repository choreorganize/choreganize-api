require 'rails_helper'

RSpec.describe Chore, type: :model do
  describe 'relationships' do
    it { should belong_to(:household) }
    it { should have_many(:assignments) }
    it { should have_many(:roommates).through(:assignments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:task_name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:outdoor) }
    it { should validate_presence_of(:weight) }
    it { should validate_numericality_of(:weight) }
    it { should validate_presence_of(:frequency) }
    # it { should validate_numericality_of(:frequency) }
    it { should define_enum_for(:frequency).with({weekly: 1, bimonthly: 2, monthly: 3}) }
  end
end
