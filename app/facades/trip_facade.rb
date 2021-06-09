class TripFacade
  class << self
    def new_trip(info)
      trip = TripsService.create_trip(info)
      Trip.new(trip)
    end
  end
end