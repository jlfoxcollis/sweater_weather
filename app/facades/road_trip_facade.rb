class RoadTripFacade
  class << self

    def get_directions(params)
      directions = MapquestGeoApi.get_directions(params)
      Roadtrip.new(directions[:route])
    end
  end
end