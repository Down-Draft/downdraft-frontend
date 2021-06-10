require 'rails_helper'

RSpec.describe 'Trips Index' do
  describe 'It displays trips for a users' do
    describe 'Happy Path' do
      before :each do
        @user = create(:user, id: 1, zip_code: '80201')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        current_user = @user
        @trip = TripsService.create_trip(user_id: @user.id, name: "Advenutures", location: "Denver", date: "2021-06-09")
        @trip2 = TripsService.create_trip(user_id: @user.id, name: "Swamp", location: "New Orleans", date: "2021-06-09")
        @trip3 = TripsService.create_trip(user_id: @user.id, name: "McDonalds", location: "Hollywood", date: "2021-06-09")
        @trips = TripsService.get_trips(@user.id)
        visit trips_path
      end

      it 'shows trips for a user', :vcr do
        save_and_open_page
        # require "pry"; binding.pry
      end
    end
  end
end
