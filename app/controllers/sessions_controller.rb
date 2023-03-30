class SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: ["Invalid email or password"] }, status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
