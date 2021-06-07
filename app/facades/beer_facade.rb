class BeerFacade
  class << self
    def get_beers_data(data)
      beers = BeerService.get_beers_data(data)
      beers.map do |beer_info|
        Beer.new(beer_info)
      end
    end

    def one_beer(beer_info)
      beer = BeerService.get_beer_data(beer_info)
      Beer.new(beer)
    end
  end
end
