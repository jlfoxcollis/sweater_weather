class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:users][:email])
    begin
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      invalid
    end
    rescue
      invalid
    end
  end
end