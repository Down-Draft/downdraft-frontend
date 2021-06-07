class BeerService
  class << self
    def get_beers_data(_data)
      # resp = conn.get("api/v1/beers") do |faraday|
      #   faraday.params["location"] = location
      # end
      parse_json(resp)
    end

    def get_beer_data(_data)
      # resp = conn.get("api/v1/beers") do |faraday|
      #   faraday.params["location"] = location
      # end
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
