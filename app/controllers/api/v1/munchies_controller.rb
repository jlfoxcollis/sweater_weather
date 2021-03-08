class Api::V1::MunchiesController < ApplicationController
  def index
    food_run = MunchiesFacade.find_the_munchies(params)
    render json: MunchieSerializer.new(food_run)
  end
end