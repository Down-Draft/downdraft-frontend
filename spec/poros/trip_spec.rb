require 'rails_helper'
describe 'Trip' do
  it 'abstracts and encapsulates trip data that can be read' do
    trip_data = {
      "name": "Climb Mt Sneffels",
      "location": '81432',
      "date": '2021-08-08',
      "user_id": 5,
      "elevation": 14158
      }
    trip =  Trip.new(trip_data)
    expect(trip.name).to eq("Climb Mt Sneffels")
    expect(trip.location).to eq("81432")
    expect(trip.date).to eq("2021-08-08")
    expect(trip.user_id).to eq(5)
    expect(trip.elevation).to eq(14158)
  end
end