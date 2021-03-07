class Api::V1::ForecastController < ApplicationController

  def index
    data = ForecastFacade.map_quest(params)
    render json: ForecastSerializer.new(data)
  end
end