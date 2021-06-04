require 'rails_helper'

RSpec.describe "Welcome Page" do 
  describe "Welcome Page" do 
    before :each do 
      visit root_path 
    end
    it "Has a title and a brief description of the application" do 
      expect(page).to have_content("Welcome to DownDraft")
      expect(page).to have_content("Meet the perfect beer for your next adventure. DownDraft recommends beer based on your destination's forecast and elevation.")
      expect(page).to have_link("Sign in with Google")
    end
  end
end