class Roadtrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data, weather, params)
    @start_city = params[:origin]
    @end_city = params[:destination]
    @travel_time = t_time(data)
    @weather_at_eta = future_forecast(weather, data)
  end

  def future_forecast(weather, data)
    if data[:info][:statuscode] == 402 || data[:route][:realTime] == 10000000
    elsif data[:route][:realTime] < 172800
      hourly_forecast(weather, data)
    else
      daily_forecast(weather, data)
    end
  end

  def hourly_forecast(weather, data)
    selected = weather[:hourly].find do |cast| 
      Time.at(cast[:dt]) > (Time.at(weather[:current][:dt] + data[:route][:realTime]))
    end
    {"temperature": selected[:temp], "conditions": selected[:weather].first[:description]}
  end

  def daily_forecast(weather, data)
    selected = weather[:daily].find do |cast| 
      binding.pry
      Time.at(cast[:dt]) > (Time.at(weather[:current][:dt] + data[:route][:realTime]))
    end
    {"temperature": selected[:temp], "conditions": selected[:weather].first[:description]}
  end

  def t_time(data)
    return "impossible route" unless data[:info][:statuscode] != 402
    convert = (data[:route][:realTime] / 60)
    hours = (convert / 60)
    minutes = (convert % 60)
    "#{hours} hours #{minutes} min"
  end
end