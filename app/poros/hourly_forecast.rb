class HourlyForecast
  attr_reader :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = time(Time.at(data[:dt]).to_datetime)
    @temperature = data[:temp]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

  def time(data)
    data.strftime("%I:%M:%S %p")
  end
end