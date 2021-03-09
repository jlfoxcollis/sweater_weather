class Api::V1::RoadTripController < ApplicationController
  before_action :check_params, :check_key

  def create
    begin
      trip = RoadTripFacade.get_directions(road_trip_params)
      render json: RoadTripSerializer.new(trip)
    rescue
      something_went_wrong
    end
  end

  private

  def check_params
    check_your_headers unless params[:road_trip][:origin] && params[:road_trip][:destination] && params[:road_trip][:api_key]
  end
  
  def check_key
    unauthorized unless params[:road_trip][:api_key].present? && User.find_by(api_key: params[:road_trip][:api_key])
  end

  def road_trip_params
    params.require(:road_trip).permit(:origin, :destination, :api_key)
  end
end