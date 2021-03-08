class Api::V1::RoadTripController < ApplicationController
  before_action :check_key

  def create
    trip = RoadTripFacade.get_directions(road_trip_params)
    render json: RoadTripSerializer.new(trip)
  end

  private

  def check_key
    unauthorized unless params[:api_key].present? && User.find_by(api_key: params[:api_key])
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end