class Api::V1::ForecastController < ApplicationController

  def index
  #params incoming should be location(city,state)
    data = ForecastFacade.get_weather(params)
    render json: ForecastSerializer.new(data)
  end

end