require 'rails_helper'

RSpec.describe Assignment, type: :model do
  describe 'relationships' do
    it { should belong_to(:chore) }
    it { should belong_to(:roommate) }
  end
end
