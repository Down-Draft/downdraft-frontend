require 'rails_helper'

RSpec.describe 'Weather Service' do
  describe '.class method' do
    describe 'create_trip' do
      describe 'happy path' do
        before :each do
          @user = create(:user, zip_code: '80201', id: 1)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        end
        it 'returns a validated trip upon creation', :vcr do
          trip_params = { name: 'Trip to Cabo', date: Time.now, location: '80206', user_id: 1 }
          results = TripsService.create_trip(trip_params)
          
          expect(results[:attributes][:location]).to eq('80206')
          expect(results[:attributes][:name]).to eq('Trip to Cabo')
          expect(results[:attributes][:date]).to eq('2021-06-10')
          expect(results[:attributes][:elevation]).to eq(5390.42012)
          expect(results[:attributes][:user_id]).to eq(1)
          expect(results[:attributes][:max_temperature]).to eq(93.7)
        end
      end
      describe 'sad path' do
        before :each do
          @user = create(:user, zip_code: '80201', id: 1)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        end
        it 'returns an error if bad params are passed', :vcr do
          trip_params = { date: Time.now, location: '80206', user_id: 1 }
          results = TripsService.create_trip(trip_params)
          expect(results).to have_key(:errors)
        end
      end
    end
  end
end
