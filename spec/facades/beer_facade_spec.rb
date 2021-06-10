require 'rails_helper'

describe 'BeerFacade' do
  it 'returns an array of beer data', :vcr do
    trip_id = 1
    facade = BeerFacade.get_beers_data(trip_id)
    expect(facade).to be_an Array
    expect(facade.first).to be_a Beer
    expect(facade.count).to eq 9
  end
end