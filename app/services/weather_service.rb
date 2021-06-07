class WeatherService
  class << self
    def get_forecast(location)
      resp = conn.get("api/v1/3-day-forecast") do |faraday|
        faraday.params["location"] = location
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
