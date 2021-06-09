require 'rails_helper'

describe 'TripFacade' do
  it 'returns an array of trip information' do
    location = "80303"
    facade = TripFacade.get_forecast(location)
    expect(facade).to be_an Array
    expect(facade.first).to be_a Trip
    expect(facade.count).to eq 1
  end
end
