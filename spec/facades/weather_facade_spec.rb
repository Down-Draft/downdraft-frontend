require 'rails_helper'

describe 'WeatherFacade' do
  it 'returns an array of forecast data for three days', :vcr do
    location = "80303"
    facade = WeatherFacade.get_forecast(location)
    expect(facade).to be_an Array
    expect(facade.first).to be_a Weather
    expect(facade.count).to eq 3
  end
end
