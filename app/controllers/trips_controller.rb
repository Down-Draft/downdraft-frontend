class TripsController < ApplicationController
  def new; end

  def create
    new_trip = TripFacade.new_trip(trip_params)
    if new_trip.is_a? Hash
      render new
      flash[:error] = new_trip[:errors]
    else

      redirect_to beers_path(params:{trip_id: new_trip.id})
    end
  end

  private

  def trip_params
    params.permit(:user_id, :name, :location, :date)
  end
end
