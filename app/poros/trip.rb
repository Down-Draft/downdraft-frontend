class Trip
  attr_reader :name,
              :location,
              :date,
              :user_id,
              :elevation,
              :id
  
  def initialize(data)
    @name = data[:data][:attributes][:name]
    @location = data[:data][:attributes][:location]
    @date = data[:data][:attributes][:date]
    @user_id = data[:data][:attributes][:user_id]
    @elevation = data[:data][:attributes][:elevation]
    @id = data[:data][:id]
    @relationships = data[:data][:attributes][:relationships]
  end

  def beers
    beers = @relationships[:beers][:data]
    beers.map do |beer|
      BeerFacade.one_beer(beer[:id])
    end
  end
end