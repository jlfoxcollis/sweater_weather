class Forecast
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
    @datetime = Time.at(data[:dt]).utc.to_datetime
    @sunrise = data[:sunrise]
    @sunset = data[:sunset]
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]

end