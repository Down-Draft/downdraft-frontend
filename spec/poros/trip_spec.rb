require 'rails_helper'
describe 'Trip' do
  it 'abstracts and encapsulates trip data that can be read' do
    trip_data={
      "data": {
          "id": "24",
          "type": "trip",
          "attributes": {
              "location": "80206",
              "name": "cabo",
              "date": "2021-10-06",
              "elevation": 5390.42012,
              "user_id": 1,
              "max_temperature": 50.00
          },
          "relationships": {}
      }
  }
    trip =  Trip.new(trip_data)
    expect(trip.name).to eq("cabo")
    expect(trip.location).to eq("80206")
    expect(trip.date).to eq("2021-10-06")
    expect(trip.user_id).to eq(1)
    expect(trip.elevation).to eq(5390.42)
    expect(trip.max_temp).to eq(50.00)
  end
end