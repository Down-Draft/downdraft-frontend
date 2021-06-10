require 'rails_helper'

RSpec.describe 'Beer Service' do
  describe '#instance method' do
    describe 'get_beers_data' do
      it 'returns data for beers given location', :vcr do
        trip_id = 1
        results = BeerService.get_beers_data(trip_id)
        expect(results[:data].class).to eq(Array)
        
      end  
    end

    describe 'search_beer_data' do
      it 'returns data for beer based on name search', :vcr do
        data = 'Cow'
        results = BeerService.search_beer_data(data)
        expect(results[:data].class).to eq(Array)
        expect(results[:data].count).to eq(6)
        expect(results[:data].last[:attributes][:name]).to eq('Spotted Cow')      
      end 
    end
   
    describe 'SAD Path - search_beer_data' do
      it 'returns no data for beer based on name search', :vcr do
        data = 'Crawfish'
        results = BeerService.search_beer_data(data)
        expect(results.class).to eq(Hash)
        expect(results[:errors]).to eq('No beers found')
      end 
    end
  end 
end
