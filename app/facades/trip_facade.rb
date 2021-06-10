class TripFacade
  class << self
    def get_single_trip(trip_id)
      trip = TripsService.get_trip_show(trip_id)
      Trip.new(trip)
    end

    def see_trip_index(user_id)
      trips = TripsService.get_trips(user_id)
      trips.map do |trip|
        Trip.new(trip)
      end
    end

    def new_trip(info)
      trip = TripsService.create_trip(info)
      if trip.include?(:errors)
        trip
      else
        Trip.new(trip)
      end
    end
  end
end
