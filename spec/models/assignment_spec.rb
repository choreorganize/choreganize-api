require 'rails_helper'

RSpec.describe Assignment, type: :model do
  describe 'relationships' do
    it { should belong_to(:chore) }
    it { should belong_to(:roommate) }
  end

  describe 'validations' do
    it { should validate_presence_of(:completed) }
  end
end
