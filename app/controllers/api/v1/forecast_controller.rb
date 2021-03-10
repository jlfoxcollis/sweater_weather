class Api::V1::ForecastController < ApplicationController

  def index
    begin
      data = ForecastFacade.map_quest(params)
      render json: ForecastSerializer.new(data)
    rescue
      something_went_wrong
    end
  end
end