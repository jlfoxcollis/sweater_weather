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

    def get_forecast(params)
      data = OpenWeatherApi.get_location(params)
      Forecast.new(data[:current])
    end
  end
end