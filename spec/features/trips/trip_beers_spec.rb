require 'rails_helper'

RSpec.describe 'Beers Controller' do
  describe 'Finding beers for a given trip' do
    before(:each) do
      @user = create(:user, zip_code: '80201')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      # @trip1 = TripFacade.new_trip(user_id: @user, name: "Mountains", location: "Denver", date: "2021-06-09")
      visit beers_path(params:{trip_id: @trip1})
    end

    it 'lists the attributes for beers rendered for a given trip', :vcr do
      # expect(page).to have_content("Beers")
    end
  end
end
