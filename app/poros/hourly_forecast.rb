class HourlyForecast
  attr_reader :temperature,
              :conditions,
              :icon,
              :time

  def initialize(data)
    @time = datetime(Time.at(data[:dt]).to_datetime)
    @temperature = data[:temp]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

  def datetime(data)
    data.strftime("%I:%M:%S %p")
  end
end