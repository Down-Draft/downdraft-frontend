require 'rails_helper'

RSpec.describe 'Trips Index' do
  describe 'It displays trips for a users' do
    describe 'Happy Path' do
      before :each do
        @user = create(:user, id: 1, zip_code: '80201')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        current_user = @user
        @trip = TripFacade.new_trip(user_id: @user.id, name: "Advenutures", location: "Denver", date: "2021-06-09")
        visit "/trips/#{@trip.id}"
      end

      it 'can show attributes for a given trip', :vcr do
        expect(page).to have_content(@trip.name)
        expect(page).to have_content(@trip.location)
        expect(page).to have_content(@trip.date)
        expect(page).to have_content(@trip.max_temp)
        expect(page).to have_content(@trip.elevation)
      end
    end

    describe 'sad path' do
      before(:each) do
        @user = create(:user, id: 1, zip_code: '80201')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        current_user = @user
        @trip = TripFacade.new_trip(user_id: @user.id, name: "Advenutures", location: "Denver", date: "2021-06-09")
        visit '/trips/2154054064'
      end

      it 'redirects to trip index if trip not found with flash message', :vcr do
        expect(current_path).to eq("/trips")
        expect(page).to have_content("Trip not found")
      end
    end
  end
end
