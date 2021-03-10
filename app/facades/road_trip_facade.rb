class RoadTripFacade
  class << self

    def get_directions(params)
      params[:origin].gsub(/\s+/, "")
      params[:destination].gsub(/\s+/, "")
      directions = MapquestGeoService.get_directions(params)
      forecast = OpenWeatherService.get_location(directions[:route][:locations].last[:latLng]) unless directions[:info][:statuscode] == 402 
      road_trip = Roadtrip.new(directions, forecast, params)
    end
  end
end