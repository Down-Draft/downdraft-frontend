class BeersController < ApplicationController
  def index
    @trip_id = params[:trip_id]
    if params[:search].present?
      @beers = BeerFacade.search_beer(params[:search])
      require 'pry'; binding.pry
    elsif @trip_id.present?
      @beers = BeerFacade.get_beers_data(@trip_id)
    end 


  end

  def show; end








end
