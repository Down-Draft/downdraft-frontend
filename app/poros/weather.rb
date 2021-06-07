class Weather
  attr_reader :location_name,
              :location_state,
              :date,
              :max_temp,
              :min_temp,
              :description,
              :icon

  def initialize(data)
    @location_name = data[:location_name]
    @location_state = data[:location_state]
    @date = nice_date(data[:date])
    @max_temp = data[:max_temp]
    @min_temp = data[:min_temp]
    @description = data[:description]
    @icon = data[:icon]
  end

  def nice_date(string)
    stringified = DateTime.strptime(string, '%Y-%m-%e')
    stringified.strftime("%a%e")
  end

  # def hyphen_date(string)
  #   string.gsub(" ", "-")
  # end
end
