class BeersController < ApplicationController
  def index
    binding.pry
  end

  def show; end

  private
  
  def trip_params
    params.permit(:user_id, :name, :location, :date)
  end
end
