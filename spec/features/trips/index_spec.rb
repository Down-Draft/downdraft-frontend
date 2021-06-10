require 'rails_helper'

RSpec.describe 'Trips Index' do
  describe 'It displays trips for a users' do
    describe 'Happy Path' do
      before :each do
        @user = create(:user, id: 1, zip_code: '80201')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        current_user = @user
        @trips = TripFacade.see_trip_index(@user.id)
        @trips.clear
        @trip = TripFacade.new_trip(user_id: @user.id, name: "Advenutures", location: "Denver", date: "2021-06-09")
        @trip2 = TripFacade.new_trip(user_id: @user.id, name: "Swamp", location: "New Orleans", date: "2021-06-09")
        @trip3 = TripFacade.new_trip(user_id: @user.id, name: "McDonalds", location: "Hollywood", date: "2021-06-09")
        @trips = TripFacade.see_trip_index(@user.id)
        visit new_trip_path
      end

      it 'can create a new trip and then go to trips index', :vcr do
        fill_in :name, with: 'Going to Joeys house'
        fill_in :date, with: Time.now
        fill_in :location, with: '80206'
        click_on 'Lets Go!'

        expect(current_path).to eq(beers_path)
        visit trips_path
        expect(page).to have_content("Trips for #{@user.full_name}")
      end

      it 'shows trips attributes', :vcr do
        visit trips_path

        expect(@trips.size).to eq(3)

        within("#trip-#{@trip.id}") do
          expect(page).to have_content(@trip.name)
          expect(page).to have_content(@trip.location)
          expect(page).to have_content(@trip.date)
        end

        within("#trip-#{@trip3.id}") do
          expect(page).to have_content(@trip3.name)
          expect(page).to have_content(@trip3.location)
          expect(page).to have_content(@trip3.date)
        end
      end
    end
  end
end
