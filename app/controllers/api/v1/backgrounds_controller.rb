class Api::V1::BackgroundsController < ApplicationController

  def index
    data = ForecastFacade.get_background(params)
    render json: BackgroundSerializer.new(data)
  end

end