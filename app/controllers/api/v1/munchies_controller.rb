class Api::V1::MunchiesController < ApplicationController
  before_action :check_params
  def index
    begin
    food_run = MunchiesFacade.find_the_munchies(params)
    render json: MunchieSerializer.new(food_run)
    rescue
      something_went_wrong
    end
  end

  private

  def check_params
    invalid unless params[:start] && params[:destination] && params[:food]
  end
end