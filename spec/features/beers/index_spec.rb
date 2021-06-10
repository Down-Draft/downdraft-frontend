require 'rails_helper'

RSpec.describe "Beers Index Page" do
  describe "I can see a table of recommended beers and details" do
    before :each, :vcr do
      @user = create(:user, zip_code: "80301")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_index_path
      fill_in :search, with: "cow"
      click_on "Search"
    end
    it "displays beer names, style, abv, and description" do
      # expect(current_path).to eq(beers_path)
      expect(page).to have_content("Beers")
      expect(page).to have_content("Beers")
      require 'pry'; binding.pry
    end
  end
end