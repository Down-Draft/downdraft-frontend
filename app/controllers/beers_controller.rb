class BeersController < ApplicationController
  def index
    TripsFacade.new_trip(trip_params)
  end

  def show; end

  private
  
  def trip_params
    params.permit(:user_id, :name, :location, :date)
  end
end
