require 'rails_helper'

RSpec.describe 'Trips Service' do
  describe '.class method' do
    describe 'create_trip' do
      it 'returns data for trips' do
        location = '80303'
        results = TripsService.create_trip(info)
        expect(results[:data].class).to eq(Array)
        
        # add additional test lines here

      end  
    end
  end 

  describe 'parse_json' do
    it 'converts returned response body into JSON' do 
       # needed stuff 

    end 
  end
end
