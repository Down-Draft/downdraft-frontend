require 'rails_helper'

RSpec.describe 'Weather Service' do
  describe '.class method' do
    describe 'get_forecast' do
      it 'returns data for three-day forecast', :vcr do
        location = '80303'
        results = WeatherService.get_forecast(location)
        expect(results[:data].count).to eq(3)
      end  
    end

    #conn
    
    #parse_json
  end 
end
