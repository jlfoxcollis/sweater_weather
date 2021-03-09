class Roadtrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data, weather)
    @start_city = "#{data[:locations].first[:adminArea5]}, #{data[:locations].first[:adminArea3]}"
    @end_city = "#{data[:locations].last[:adminArea5]}, #{data[:locations].last[:adminArea3]}"
    @travel_time = t_time(data[:realTime])
    @weather_at_eta = future_forecast(weather, data)
  end

  def future_forecast(weather, data)
    selected = weather.select {|cast| Time.at(cast[:dt]) > (Time.now + data[:realTime])}.first
    {"temperature": selected[:temp], "conditions": selected[:weather].first[:description]}
  end


  def t_time(data)
    convert = (data / 60)
    hours = (convert / 60)
    minutes = (convert % 60)
    "#{hours} hours #{minutes} min"
  end
end