require 'rails_helper'

RSpec.describe 'Beers Controller' do
  describe 'Finding beers for a given trip' do
    before(:each) do
      @user = create(:user, zip_code: '80201')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      @trip1 = TripFacade.new_trip(user_id: @user.id, name: "Mountains", location: "Denver", date: "2021-06-10")
      visit beers_path(params:{trip_id: @trip1.id})
    end

    it 'displays a button to add beers recommended for a given trip', :vcr do
      expect(page).to have_content("Beers")
      expect(page).to have_button("Add beer to trip!")
    end
    
    xit 'can add a beer and redirect to the trip show page', :vcr do
      # VCR.use_cassette("can_add_a_beer_and_redirect_to_the_trip_show_page")
      expect(page).to have_content("Beers")
      within "#beer-4062" do 
        expect(page).to have_button("Add beer to trip!")
        click_button "Add beer to trip!"
      end
      expect(current_path).to eq(trip_path)
      # expect(page).to have_content("Tailgate Light")
    end
  end
end
