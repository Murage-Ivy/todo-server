class SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user&.authenicate(user_params[:password])
      session[:user_id] = user_id
      render json: user, status: :created
    else
      render json: { errors: ["Invalid email or password"] }, status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end
end
