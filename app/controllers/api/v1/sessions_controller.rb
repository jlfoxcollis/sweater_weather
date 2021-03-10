class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:users][:email])
    if user.authenticate(params[:users][:password])
      render json: UserSerializer.new(user)
    else
      invalid
    end
  end
end