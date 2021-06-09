class TripFacade
  class << self
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