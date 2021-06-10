class BeerFacade
  class << self
    def get_beers_data(trip_id)
      beers = BeerService.get_beers_data(trip_id)
      beers[:data].map do |beer|
        Beer.new(beer)
      end
    end

    def one_beer(beer_info)
      beer = BeerService.get_beer_data(beer_info)
      Beer.new(beer)
    end

    def search_beer(name)
      beers = BeerService.search_beer_data(name)
      beers[:data].map do |beer|
        Beer.new(beer)
      end
    end
  end
end
