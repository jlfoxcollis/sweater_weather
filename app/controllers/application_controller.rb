class ApplicationController < ActionController::API
  before_action :check_status, :check_accept

  private

  def check_status
    check_your_headers unless request.env["CONTENT_TYPE"] == "application/json"
  end

  def check_accept
    check_your_headers unless request.env["HTTP_ACCEPT"] == "application/json"
  end

  def check_your_headers
    render json: {"error": "Invalid Request, check your headers"}, status: 415
  end
end
