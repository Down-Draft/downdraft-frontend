require 'rails_helper'
describe 'Weather' do
  it 'abstracts and encapsulates weather details data that can be read' do
    weather_data = {
      "location_name": "Boulder",
      "location_state": "Colorado",
      "date": "2021-06-06",
      "max_temp": 80.6,
      "min_temp": 60.3,
      "description": "Moderate rain",
      "icon": "//cdn.weatherapi.com/weather/64x64/day/302.png"
      }
    weather =  Weather.new(weather_data)
    expect(weather.location_name).to eq("Boulder")
    expect(weather.location_state).to eq("Colorado")
    expect(weather.date).to eq("Sun 6")
    expect(weather.max_temp).to eq(80.6)
    expect(weather.min_temp).to eq(60.3)
    expect(weather.description).to eq("Moderate rain")
    expect(weather.icon).to eq("//cdn.weatherapi.com/weather/64x64/day/302.png")
  end
end