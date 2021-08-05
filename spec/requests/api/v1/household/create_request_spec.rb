require 'rails_helper'

RSpec.describe "Household create  API" do

  context 'happy paths' do
    it ' returns household information' do
      post '/api/v1/household', params: {
        household: {
          address: '22b baker st',
          city: 'metropolis',
          state: 'key stone',
          password: 'super secret',
          password_confirmation: 'super secret'
        }
      }
      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body[:data]).to have_key(:id)
      expect(body[:data]).to have_key(:type)
      expect(body[:data][:type]).to eq('households')

      expect(body[:data]).to have_key(:attributes)
      expect(body[:data][:attributes][:address]).to eq('22b baker st')
      expect(body[:data][:attributes][:city]).to eq('metropolis')
      expect(body[:data][:attributes][:state]).to eq('key stone')

      expect(body[:data][:attributes][:chores]).to eq([])
    end

    it ' adds something to data base' do

      test = Household.find_by(address: '22b baker st')
      expect(test).to eq(nil)

      post '/api/v1/household', params: {
        household: {
          address: '22b baker st',
          city: 'metropolis',
          state: 'key stone',
          password: 'super secret',
          password_confirmation: 'super secret'
        }
      }

      test_2 = Household.find_by(address: '22b baker st')

      expect(test_2.class).to eq(Household)
    end
  end

  context 'sad paths' do
    describe 'invalid city ' do
      describe 'city left blank' do
        it 'returns errors' do
          post '/api/v1/household', params: {
            household: {
              address: '22b baker st',
              state: 'key stone',
              password: 'super secret',
              password_confirmation: 'super secret'
            }
          }
          body = JSON.parse(response.body, symbolize_names: true)

          expect(response.status).to eq(400)

          expect(body[:data]).to have_key(:message)
          expect(body[:data]).to have_key(:errors)
          expect(body[:data][:message]).to eq("your query could not be completed")
          expect(body[:data][:errors]).to eq('cannot create household')
        end
        it 'does not add anything to the data base' do

          test = Household.find_by(address: '22b baker st')
          expect(test).to eq(nil)

          post '/api/v1/household', params: {
            household: {
              address: '22b baker st',
              state: 'key stone',
              password: 'super secret',
              password_confirmation: 'super secret'
            }
          }

          test_2 = Household.find_by(address: '22b baker st')

          expect(test_2.class).to eq(NilClass)
        end
      end
    end
    describe 'invalid state ' do
      it 'returns errors' do
        post '/api/v1/household', params: {
          household: {
            city: 'metropolis',
            address: '22b baker st',
            password: 'super secret',
            password_confirmation: 'super secret'
          }
        }
        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(400)

        expect(body[:data]).to have_key(:message)
        expect(body[:data]).to have_key(:errors)
        expect(body[:data][:message]).to eq("your query could not be completed")
        expect(body[:data][:errors]).to eq('cannot create household')
      end
      it 'does not add anything to the data base' do

        test = Household.find_by(address: '22b baker st')
        expect(test).to eq(nil)

        post '/api/v1/household', params: {
          household: {
            address: '22b baker st',
            city: 'metropolis',
            password: 'super secret',
            password_confirmation: 'super secret'
          }
        }

        test_2 = Household.find_by(address: '22b baker st')

        expect(test_2.class).to eq(NilClass)
      end
    end
    describe 'invalid address  ' do
      it 'returns errors' do
        post '/api/v1/household', params: {
          household: {
            city: 'metropolis',
            state: 'key stone',
            password: 'super secret',
            password_confirmation: 'super secret'
          }
        }
        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(400)

        expect(body[:data]).to have_key(:message)
        expect(body[:data]).to have_key(:errors)
        expect(body[:data][:message]).to eq("your query could not be completed")
        expect(body[:data][:errors]).to eq('cannot create household')
      end
      it 'does not add anything to the data base' do

        test = Household.find_by(address: '22b baker st')
        expect(test).to eq(nil)

        post '/api/v1/household', params: {
          household: {
            city: 'metropolis',
            state: 'key stone',
            password: 'super secret',
            password_confirmation: 'super secret'
          }
        }

        test_2 = Household.find_by(address: '22b baker st')

        expect(test_2.class).to eq(NilClass)
      end
    end

    describe 'invalid password ' do
      describe 'missing password' do
        it 'returns errors' do
          post '/api/v1/household', params: {
            household: {
              address: '22b baker st',
              city: 'metropolis',
              state: 'key stone',
              password_confirmation: 'super secret'
            }
          }
          body = JSON.parse(response.body, symbolize_names: true)

          expect(response.status).to eq(400)

          expect(body[:data]).to have_key(:message)
          expect(body[:data]).to have_key(:errors)
          expect(body[:data][:message]).to eq("your query could not be completed")
          expect(body[:data][:errors]).to eq('cannot create household')
        end
        it 'does not add anything to the data base' do

          test = Household.find_by(address: '22b baker st')
          expect(test).to eq(nil)

          post '/api/v1/household', params: {
            household: {
              address: '22b baker st',
              city: 'metropolis',
              state: 'key stone',
              password_confirmation: 'super secret'
            }
          }

          test_2 = Household.find_by(address: '22b baker st')

          expect(test_2.class).to eq(NilClass)
        end

      end

      # describe 'missing password_confirmation' do
      #   it 'returns errors' do
      #     post '/api/v1/household', params: {
      #       household: {
      #         address: '22b baker st',
      #         city: 'metropolis',
      #         state: 'key stone',
      #         password: 'super secret'
      #       }
      #     }
      #     body = JSON.parse(response.body, symbolize_names: true)
      #
      #     expect(response.status).to eq(400)
      #
      #     expect(body[:data]).to have_key(:message)
      #     expect(body[:data]).to have_key(:errors)
      #     expect(body[:data][:message]).to eq("your query could not be completed")
      #     expect(body[:data][:errors]).to eq('cannot create household')
      #   end
      #   it 'does not add anything to the data base' do
      #
      #     test = Household.find_by(address: '22b baker st')
      #     expect(test).to eq(nil)
      #
      #     post '/api/v1/household', params: {
      #       household: {
      #         address: '22b baker st',
      #         city: 'metropolis',
      #         state: 'key stone',
      #         password: 'super secret'
      #       }
      #     }
      #
      #     test_2 = Household.find_by(address: '22b baker st')
      #
      #     expect(test_2.class).to eq(NilClass)
      #   end
      #
      #
      # end

      describe 'passwords dont match' do
        it 'returns errors' do
          post '/api/v1/household', params: {
            household: {
              address: '22b baker st',
              city: 'metropolis',
              state: 'key stone',
              password: 'sooper secret',
              password_confirmation: 'super secret'
            }
          }
          body = JSON.parse(response.body, symbolize_names: true)

          expect(response.status).to eq(400)

          expect(body[:data]).to have_key(:message)
          expect(body[:data]).to have_key(:errors)
          expect(body[:data][:message]).to eq("your query could not be completed")
          expect(body[:data][:errors]).to eq('cannot create household')
        end
        it 'does not add anything to the data base' do

          test = Household.find_by(address: '22b baker st')
          expect(test).to eq(nil)

          post '/api/v1/household', params: {
            household: {
              address: '22b baker st',
              city: 'metropolis',
              state: 'key stone',
              password: 'sooper secret',
              password_confirmation: 'super secret'
            }
          }

          test_2 = Household.find_by(address: '22b baker st')

          expect(test_2.class).to eq(NilClass)
        end
      end
    end
  end
end
