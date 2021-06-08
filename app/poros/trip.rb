class Trip
  attr_reader :name,
              :location,
              :date,
              :user_id,
              :elevation,
              :id
  
  def initialize(data)
    @name = data[:name]
    @location = data[:location]
    @date = data[:date]
    @user_id = data[:user_id]
    @elevation = data[:elevation]
    @id = data[:id]
    @relationships = data[:relationships]
  end

  def beers
    beers = @relationships[:beers][:data]
    beers.map do |beer|
      BeerFacade.one_beer(beer[:id])
    end
  end
end