class MunchiesFacade

  def self.find_the_munchies(params)
    params[:origin] = params[:start]
    directions = MapquestGeoApi.get_directions(params)
  end
end