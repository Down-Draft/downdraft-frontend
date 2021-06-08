require 'rails_helper'
describe 'BeerInfo' do
  it 'abstracts and encapsulates beer details data that can be read' do
    beer_data = {
      "name": "Denver Lager",
      "description": 'tastes like Denver',
      "abv": 5.5,
      "style": "lager"
      }
    beer =  BeerInfo.new(beer_data)
    expect(beer.name).to eq("Denver Lager")
    expect(beer.description).to eq("tastes like Denver")
    expect(beer.abv).to eq(5.5)
    expect(beer.style).to eq("lager")
  end
end