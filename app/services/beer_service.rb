class BeerService
  class << self
    def get_beers_data(trip_id)
      resp = conn.get("api/v1/beers") do |faraday|
        faraday.params["trip_id"] = trip_id
      end
      parse_json(resp)
    end

    def get_beer_data(data)
      # resp = conn.get("api/v1/beers") do |faraday|
      #   faraday.params["location"] = location
      # end
      parse_json(resp)
    end
    
    def search_beer_data(data)
      resp = conn.get("api/v1/beers/search") do |faraday|
        faraday.params["name"] = data
      end
      parse_json(resp)
    end

    private

    def conn
      Faraday.new(url: 'https://downdraft-backend.herokuapp.com')
    end

    def parse_json(resp)
      JSON.parse(resp.body, symbolize_names: true)
    end
  end
end
