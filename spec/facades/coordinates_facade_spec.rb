require 'rails_helper'

RSpec.describe CoordinatesFacade do 
  describe 'class methods' do
    describe '::coordinates' do
      it 'returns latitude and longitude' do
        VCR.use_cassette("coordinates") do
          coordinates = CoordinatesFacade.coordinates('boston', 'ma') 
          
          expect(coordinates).to be_a(Hash)
          expect(coordinates).to have_key(:lat)
          expect(coordinates).to have_key(:lng)
          expect(coordinates).to_not have_key(:locations)
        end
      end 
    end
  end
end 
