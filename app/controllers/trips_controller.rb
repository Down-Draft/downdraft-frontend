class TripsController < ApplicationController
  def index
    @trips = TripFacade.see_trip_index(current_user.id)
  end

  def show
    if TripsService.get_trip_show(params[:id])[:id].nil?
      redirect_to "/trips"
      flash[:error] = "Trip not found"
    else
      @trip = TripFacade.get_single_trip(params[:id])
    end
  end

  def new; end

  def create
    new_trip = TripFacade.new_trip(trip_params)
    if new_trip.is_a? Hash

      flash[:error] = new_trip[:errors]
      render :new
    else
      redirect_to beers_path(params:{trip_id: new_trip.id})
    end
  end

  private

  def trip_params
    params.permit(:user_id, :name, :location, :date)
  end
end
