class Trip
  attr_reader :name,
              :location,
              :date,
              :user_id,
              :elevation,
              :id,
              :max_temp
  
  def initialize(data)
    @name = data[:data][:attributes][:name]
    @location = data[:data][:attributes][:location]
    @date = data[:data][:attributes][:date]
    @user_id = data[:data][:attributes][:user_id]
    @elevation = data[:data][:attributes][:elevation].round(2)
    @id = data[:data][:id]
    @max_temp = data[:data][:attributes][:max_temperature]
    @relationships = data[:data][:attributes][:relationships]
  end

  def beers
    beers = @relationships[:beers][:data]
    beers.map do |beer|
      BeerFacade.one_beer(beer[:id])
    end
  end
end