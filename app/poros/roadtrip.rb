class Roadtrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data)
    @start_city = "#{data[:locations].first[:adminArea5]}, #{data[:locations].first[:adminArea3]}"
    @end_city = "#{data[:locations].last[:adminArea5]}, #{data[:locations].last[:adminArea3]}"
    @travel_time = Time.at(data[:route][:realTime]).strftime("%I:%M%p")
    @weather_at_eta = weather(data)
  end

  def weather(data)
    forecast = OpenWeatherApi.future_forecast(data[:locations].first[:latLng], data[:locations].last[:latLng])
    binding.pry
    {"temperature": forecast[:]}
  end
end