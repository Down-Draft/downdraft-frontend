require 'rails_helper'
describe 'BeerInfo' do
  it 'abstracts and encapsulates beer details data that can be read' do
    beer_data = {
            "id": "2473",
            "type": "beer",
            "attributes": {
                "name": "Spotted Cow",
                "description": "Cask conditioned ale",
                "abv": 4.800000190734863,
                "style": "American-Style Amber/Red Ale"
            }
        }
    beer =  Beer.new(beer_data)
    expect(beer.name).to eq("Spotted Cow")
    expect(beer.description).to eq("Cask conditioned ale")
    expect(beer.abv).to eq(4.8)
    expect(beer.style).to eq("American-Style Amber/Red Ale")
  end
end