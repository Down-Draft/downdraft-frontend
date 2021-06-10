class WeatherFacade
  class << self
    def get_forecast(location)
      weather = WeatherService.get_forecast(location)
      return weather[:errors] if weather[:errors].present?
      weather[:data].map do |data|
        Weather.new(data[:attributes])
      end
    end
  end
end
