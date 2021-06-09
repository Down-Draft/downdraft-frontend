class TripsService
  class << self
    def create_trip(info)
      resp = conn.post('api/v1/trips') do |faraday|
        info.each do |k, v|
          faraday.params[k] = v
        end
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