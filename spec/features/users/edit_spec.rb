require 'rails_helper'

RSpec.describe "Edit User" do
  before :each do 
    @user = create(:user, id: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit edit_user_path(@user.id)
  end
  it "user can add a zipcode", :vcr do 
    expect(page).to have_content("To get started, please enter your zip code below.")
    fill_in "user[zip_code]", with: "12345"
    click_on "Submit"
    expect(current_path).to eq(dashboard_index_path)
  end
  
  it "user will be shown and error if invalid zipcode", :vcr do 
    expect(page).to have_content("To get started, please enter your zip code below.")
    fill_in "user[zip_code]", with: "00000"
    click_on "Submit"
    expect(current_path).to eq(edit_user_path(@user.id))
    expect(page).to have_content("Location not found")
  end
end