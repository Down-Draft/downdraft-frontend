require 'rails_helper'

RSpec.describe 'New Trip Form' do
  describe 'It displays the trip form' do
    describe 'Happy Path' do
      before :each do
        @user = create(:user, zip_code: '80201')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        visit new_trip_path
      end
      it 'can render a form with all the correct fields' do
        # expect(page).to have_field(:user_id)
        expect(page).to have_field(:name)
        expect(page).to have_field(:date)
        expect(page).to have_field(:location)
        expect(page).to have_button('Lets Go!')
      end
      it 'can create a new trip and receive confirmation from the BE if all fields are valid', :vcr do
        fill_in :name, with: "Going to Joeys house"
        fill_in :date, with: Time.now
        fill_in :location, with: "80206"
        click_on 'Lets Go!'

        expect(current_path).to eq(beers_path)
      end
    end

    # it "Has a title and a brief description of the application" do
    #   expect(page).to have_content("Welcome to DownDraft")
    #   expect(page).to have_content("Meet the perfect beer for your next adventure. DownDraft recommends beer based on your destination's forecast and elevation.")
    #   expect(page).to have_link("Sign in with Google")
    # end

    # it "Redirects to Google Sign in" do
    #   click_link "Sign in with Google"
    #   expect(response).to have_http_status(:success)
    # end
  end
end
