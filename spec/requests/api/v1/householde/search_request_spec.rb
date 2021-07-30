# require 'rails_helper'
#
# RSpec.describe "Household Show page API" do
#   before(:all) do
#     @household_0 = create(:mock_household)
#     @household_1 = create(:mock_household)
#     @household_2 = create(:mock_household)
#     @household = create(:mock_household)
#     # Roommate.destroy_all
#   end
#
#   context 'happy paths' do
#     it ' sends info on household' do
#
#       get "/api/v1/household/search", params: {
#           city: @household.address,
#           state: @household.city,
#           adress: @household.state
#         }
#
#       body = JSON.parse(response.body, symbolize_names: true)
#
#       expect(response).to be_successful
#
#       expect(body[:data]).to have_key(:id)
#       expect(body[:data][:id]).to eq("#{@household.id}")
#       expect(body[:data]).to have_key(:type)
#       expect(body[:data][:type]).to eq('households')
#
#       expect(body[:data]).to have_key(:attributes)
#       expect(body[:data][:attributes][:address]).to eq(@household.address)
#       expect(body[:data][:attributes][:city]).to eq(@household.city)
#       expect(body[:data][:attributes][:state]).to eq(@household.state)
#
#       expect(body[:data][:attributes]).to_not have_key(:housecode_digest)
#       expect(body[:data][:attributes][:housecode_digest]).to_not eq(@household.housecode_digest)
#       expect(body[:data][:attributes][:housecode_digest]).to eq(nil)
#     end
#   end
# end
