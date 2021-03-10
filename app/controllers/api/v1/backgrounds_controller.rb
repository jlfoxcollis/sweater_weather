class Api::V1::BackgroundsController < ApplicationController

  def index
    begin
      data = BackgroundFacade.get_background(params)
      render json: BackgroundSerializer.new(data)
    rescue
      something_went_wrong
    end
  end

end