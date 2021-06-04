require 'rails_helper'

RSpec.describe "Dashboard Page" do
  describe "User Dashboard" do
    before :each do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_index_path
    end
    
    it "displays welcome, profile image and logout link for signed in user" do 
      expect(page).to have_content("Welcome #{@user.full_name}")
      expect(page).to have_xpath("//img[@src='#{@user.avatar_url}']")
      expect(page).to have_link("Logout")
    end
    
  end
end
