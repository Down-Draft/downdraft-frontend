class DashboardController < ApplicationController
  def index
    @weather = WeatherFacade.get_forecast(current_user.zip_code)
    if @weather.is_a? String
      redirect_to edit_user_path(current_user) 
      flash[:error] = @weather 
    end 
    # @beer_of_the_day =
    # @upcoming_trips = TripFacade.get_trips()
  end
end
