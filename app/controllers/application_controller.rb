class ApplicationController < ActionController::API
  before_action :check_status, :check_accept

rescue_from ActionController::ParameterMissing do |e|
  check_your_headers
end

  private

  def check_status
    check_your_headers unless request.env["CONTENT_TYPE"] == "application/json"
  end

  def check_accept
    check_your_headers unless request.env["HTTP_ACCEPT"] == "application/json"
  end

  def check_your_headers
    render json: {"error": "Invalid Request"}, status: 415
  end

  def invalid
    render json: {"error": "Invalid Credentials"}, status: 400
  end

  def unauthorized
    render json: {"error": "Unauthorized"}, status: 401
  end
  
  def something_went_wrong
    render json: {"error": "Something went wrong.  Please try again later."}, status: 400
  end
end
