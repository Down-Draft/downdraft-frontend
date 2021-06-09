require 'rails_helper'

describe 'BeerFacade' do
  it 'returns an array of beer data', :vcr do
    location = "80303"
    facade = BeerFacade.get_beers_data(location)
    expect(facade).to be_an Array
    expect(facade.first).to be_a Beer
    expect(facade.count).to eq 10 # how do we limit results?
  end
end