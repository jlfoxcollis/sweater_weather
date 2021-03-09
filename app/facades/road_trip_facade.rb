class RoadTripFacade
  class << self

    def get_directions(params)
      directions = MapquestGeoService.get_directions(params)  
      forecast = OpenWeatherService.get_location(directions[:route][:locations].last[:latLng])
      Roadtrip.new(directions[:route], forecast[:hourly])
    end
  end
end