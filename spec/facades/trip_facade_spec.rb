require 'rails_helper'

describe 'TripFacade' do
  it 'can create a trip', :vcr do
    trip_details= {
      name: "Going to Cabo",
      location: "80206",
      date: "2021-06-10",
      user_id: 1,
    }
    facade = TripFacade.new_trip(trip_details)
    expect(facade.date).to eq("2021-06-10")
    expect(facade.elevation).to eq(5390.42)
    expect(facade.id).to eq("28")
    expect(facade.location).to eq("80206")
    expect(facade.name).to eq("Going to Cabo")
    expect(facade.user_id).to eq(1)
    expect(facade.max_temp).to eq(93.7)
    expect(facade).to be_a Trip
  end
end
