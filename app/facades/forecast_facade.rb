class ForecastFacade
  class << self 
    def get_lat_lon(params)
      if params[:location]
        map_quest(params)
      elsif params[:city] && params[:state]
        params[:location] = "#{params[:city]},#{params[:state]}"
        map_quest(params)
      end
    end

    def map_quest(params)
      data = MapquestGeoApi.get_location(params)
      latLng = data[:results].first[:locations].first[:latLng]
      get_forecast(latLng)
    end

    # def get_forecast(params)
    #   data = OpenWeatherApi.get_location(params)
    #   {"current_weather": Forecast.new(data[:current]), 
    #   "daily_weather": data[:daily].map {|day| DailyForecast.new(day)}.first(5), 
    #   "hourly_weather": data[:hourly].map {|hour| HourlyForecast.new(hour)}.first(8)}
    # end

    def get_forecast(params)
      data = OpenWeatherApi.get_location(params)
      Forecast.new(data)
    end
  end
end