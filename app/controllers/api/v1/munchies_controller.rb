class Api::V1::MunchiesController < ApplicationController
  def index
    food_run = MunchiesFacade.find_the_munchies(params)
  end
end