class ApplicationController < ActionController::API

  private

  def check_status
    check_your_headers unless request.format.symbol == :json
  end

  def check_your_headers
    render json: {"error": "Request content type must be application/json"}, status: 415
  end
end
