class TripsController < ApplicationController
  def new

  end

  def create

  end

  def destroy

  end

  private

  def trip_params
    params.permit()
  end
end