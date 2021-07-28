require 'rails_helper'

RSpec.describe MapQuestService do

  describe 'class methods' do
    describe '::get_coordinates' do
      it 'can connect to the Map Quest API' do
        VCR.use_cassette("map_quest_coordinates") do
          response = MapQuestService.get_coordinates("boston,ma")
        
          expect(response).to be_a(Hash)
          expect(response).to have_key(:info)
          expect(response[:info]).to have_key(:statuscode)
          expect(response[:results].first).to have_key(:providedLocation)
        end
      end
    end
  end
end