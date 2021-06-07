class DashboardController < ApplicationController
  def index
    @weather = WeatherFacade.get_forecast(current_user.zip_code)
    # @beer_of_the_day =
    # @upcoming_trips = TripFacade.get_trips()
  end
end
