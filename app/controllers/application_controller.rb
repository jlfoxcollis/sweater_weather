class ApplicationController < ActionController::API
  before_action :check_status

  private

  def check_status
    check_your_headers unless request.env["CONTENT_TYPE"] == "application/json"
  end

  def check_your_headers
    render json: {"error": "Request content type must be application/json"}, status: 415
  end
end
