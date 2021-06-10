class BeersController < ApplicationController
  def index
    if params[:search].present?

    else
      require "pry"; binding.pry
      @trip = TripFacade.get_trip
      @beers = trip_id
    end

  end

  def show; end









end
