class Api::V1::ForecastController < ApplicationController

  def index
  #params incoming should be location(city,state(location))
    data = ForecastFacade.get_lat_lon(params)
    render json: ForecastSerializer.new(data)
  end

end