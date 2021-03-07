class CurrentForecast
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @datetime = time(Time.at(data[:dt]).to_datetime)
    @sunrise = time(Time.at(data[:sunrise]).to_datetime)
    @sunset = time(Time.at(data[:sunset]).to_datetime)
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

  def time(data)
    data.strftime("%a,%b %d %Y %H:%M:%S %z")
  end
end