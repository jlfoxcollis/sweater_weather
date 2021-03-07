class Api::V1::ForecastController < ApplicationController

  def index
    data = ForecastFacade.get_lat_lon(params)
    render json: ForecastSerializer.new(data)
  end
end