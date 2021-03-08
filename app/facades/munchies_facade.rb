class MunchiesFacade

  def self.find_the_munchies(params)
    params[:origin] = params[:start]
    directions = MapquestGeoApi.get_directions(params)
    restaurant = YelpApi.get_restaurant(params)
    weather = OpenWeatherApi.get_location(directions[:route][:locations].last[:latLng])
    Munchy.new(directions[:route], restaurant[:businesses].first, weather[:current])
  end
end