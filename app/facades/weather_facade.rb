class WeatherFacade
  class << self
    def get_forecast(location)
      weather = WeatherService.get_forecast(location)
      weather[:data].map do |data|
        Weather.new(data[:attributes])
      end
    end
  end
end
