class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    begin
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: {"error": "Invalid Credentials"}
    end
    rescue
      render json: {"error": "Invalid Credentials"}
    end
  end

end