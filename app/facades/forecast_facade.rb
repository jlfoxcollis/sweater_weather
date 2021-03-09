class ForecastFacade
  class << self 
    def map_quest(params)
      data = MapquestGeoService.get_location(params)
      latLng = data[:results].first[:locations].first[:latLng]
      get_forecast(latLng)
    end

    def get_forecast(params)
      data = OpenWeatherService.get_location(params)
      Forecast.new(data)
    end

    def get_background(params)
      params[:search] = params[:location].split(',').first
      data = UnsplashService.get_background(params)[:results].first
      Background.new(data, params)
    end
  end
end