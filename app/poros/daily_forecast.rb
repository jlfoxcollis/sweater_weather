class DailyForecast
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:dt]).to_date.strftime("%b %d, %Y")
    @sunrise = time(Time.at(data[:sunrise]).to_datetime)
    @sunset = time(Time.at(data[:sunset]).to_datetime)
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

  def time(data)
    data.strftime("%a,%b %d %Y %H:%M:%S %z")
  end
end