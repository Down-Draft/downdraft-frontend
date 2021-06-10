class Trip
  attr_reader :name,
              :location,
              :date,
              :user_id,
              :elevation,
              :id,
              :max_temp

  def initialize(data)
    @name = data[:attributes][:name]
    @location = data[:attributes][:location]
    @date = data[:attributes][:date]
    @user_id = data[:attributes][:user_id]
    @elevation = data[:attributes][:elevation].round(2)
    @id = data[:id]
    @max_temp = data[:attributes][:max_temperature]
    @relationships = data
  end

  def beers
    beers = @relationships[:relationships][:beers][:data]
    beers.map do |beer|
      BeerFacade.one_beer(beer[:id].to_i)
    end
  end
end
