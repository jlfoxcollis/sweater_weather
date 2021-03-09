class RoadTripFacade
  class << self

    def get_directions(params)
      directions = MapquestGeoApi.get_directions(params)  
      forecast = OpenWeatherApi.get_location(directions[:route][:locations].last[:latLng])
      Roadtrip.new(directions[:route], forecast[:hourly])
    end
  end
end