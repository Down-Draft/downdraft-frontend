class TripsController < ApplicationController
  def new
  end

  def index
  end

  def destroy; end

  private

  def trip_params
    params.permit
  end
end
