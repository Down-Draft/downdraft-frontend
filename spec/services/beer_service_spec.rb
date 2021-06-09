require 'rails_helper'

RSpec.describe 'Beer Service' do
  describe '#instance method' do
    describe 'get_beers_data' do
      it 'returns data for beers given location' do
        location = '80303'
        results = BeerService.get_beers_data(location)
        expect(results[:data].class).to eq(Array)
        
        # add additional test lines here

      end  
    end
  
    describe 'get_beer_data' do
      it 'returns data for beer given location' do
        location = '80303'
        results = BeerService.get_beer_data(location)
        expect(results[:data].class).to eq(Array)
        
        # add additional test lines here
        
      end  
    end
  end 

  describe ".class methods" do
    describe 'conn' do 
      it 'creates a new Faraday for the backend url/endpoint' do 
        
      end
    end

    describe 'parse_json' do
      it 'converts returned response body into JSON' do 
        # needed stuff 

      end 
    end
  end 
end
