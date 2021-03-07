class Forecast

  def initialize(data)
    @data = data
    @current_weather = current_weather
    @hourly_weather = hourly_weather
    @daily_weather = daily_weather
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