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
          expect(page).to have_content("Patchy rain possible")
          expect(page).to have_content("High: 87.4")
          expect(page).to have_content("Low: 63.1")
        end
        within("#forecast-2") do
          expect(page).to have_content("Patchy rain possible")
          expect(page).to have_content("High: 90.7")
          expect(page).to have_content("Low: 62.8")
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
      # describe "Nav Bar" do
      #   it "has a link to the Dashboard" do
      #   end
      #
      #   it "displays link to create a trip" do
      #   end
      #
      #   it "has a search bar to search for a beer by name" do
      #   end
      #
      #   it "has a link to log out" do
      #   end
      # end
    end

    # describe "SAD Path" do
    #   it "renders 404 if no current_user", :vcr do
    #     allow_any_instance_of(WeatherFacade).to receive(:get_forecast).and_return("spec/fixtures/vcr_cassettes/Dashboard_Page/User_Dashboard/displays_welcome_profile_image_and_logout_link_for_signed_in_user.yml")
    #     visit dashboard_index_path
    #     expect(page).to have_link("Click here to login")
    #   end
    # end
  end
end
