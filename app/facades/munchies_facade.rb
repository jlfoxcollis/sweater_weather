class MunchiesFacade

  def self.find_the_munchies(params)
    params[:origin] = params[:start]
    directions = MapquestGeoApi.get_directions(params)
    restaurant = YelpApi.get_restaurant(params)
    Munchy.new(directions[:route], restaurant[:businesses].first, params)
  end
end