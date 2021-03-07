class Forecast

  def initialize(data)
    @data = data
  end

  def current_weather
    CurrentForecast.new(@data[:current])
  end

  def hourly_weather
    @data[:hourly].map {|hour| HourlyForecast.new(hour)}.first(8)
  end

  def daily_weather
    @data[:daily].map {|day| DailyForecast.new(day)}.first(5)
  end
end