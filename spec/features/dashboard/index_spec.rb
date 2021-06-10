require 'rails_helper'

RSpec.describe "Dashboard Page" do
  describe "Happy Path" do
    before :each do
      @user = create(:user, zip_code: "80201")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_index_path
    end
    describe "User Dashboard" do
      it "displays welcome, profile image and logout link for signed in user", :vcr do
        expect(page).to have_content("Welcome #{@user.full_name}")
        expect(page).to have_xpath("//img[@src='#{@user.avatar_url}']")
        expect(page).to have_link("Logout")
      end

      it "displays the a three-day weather forecast with temps icons and description", :vcr do
        expect(page).to have_content("Three Day Forecast for Denver, Colorado")
        within(".weather-forecast") do
          expect(page).to have_content("Low:", count: 3)
        end
        within("#forecast-0") do
          expect(page).to have_content("Overcast")
          expect(page).to have_content("High: 93.4")
          expect(page).to have_content("Low: 65.8")
        end
        within("#forecast-2") do
          expect(page).to have_content("Partly cloudy")
          expect(page).to have_content("High: 88.9")
          expect(page).to have_content("Low: 67.5")
        end
      end

      # it "displays button to create a trip" do
      # end
      #
      # it "displays up to 3 upcoming trips with name and link to Trip Show page" do
      # end
      #
      # it "displays a Beer of the Day with name, abv, image, and link to Beer Show page" do
      # end
      #
      describe "Nav Bar" do
        it "has a link to the Dashboard", :vcr do
          click_link 'Home'
          expect(current_path).to eq(dashboard_index_path)
        end
      
        it "displays link to create a trip", :vcr do
          click_link "New Trip"
          expect(current_path).to eq(new_trip_path)
        end
        it "displays link to trip index", :vcr do
          click_link "Scheduled Trips"
          expect(current_path).to eq(trips_path)
        end
      
        it "has a search bar to search for a beer by name", :vcr do
          fill_in :search, with: 'cow'
          click_button :commit
          
          expect(current_path).to eq(beers_path)
          expect(page).to have_content('Apocalypse Cow')
        end
      
        it "has a link to log out", :vcr do
          click_link "Logout"
          
          expect(current_path).to eq(root_path)
          expect(page).to have_content("You have successfully logged out")
        end
      end
    end
  end

  describe "SAD Path" do
    it "renders 404 if no current_user" do
      visit dashboard_index_path
      expect(page).to have_link("Click here to login")
    end
  end
end
