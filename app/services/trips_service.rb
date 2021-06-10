class TripsService
  class << self
    def get_trip_show(trip_id)
      resp = conn.get("/api/v1/trips/#{trip_id}")
      parse_json(resp)[:data]
    end

    def get_trips(user_id)
      resp = conn.get("/api/v1/trips?user_id=#{user_id}")
      parse_json(resp)[:data]
    end

    def create_trip(info)
      resp = conn.post('api/v1/trips') do |faraday|
        info.each do |k, v|
          faraday.params[k] = v
        end
      end
      if resp.body.include?("errors")
        parse_json(resp)
      else
        parse_json(resp)[:data]
      end
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
