class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authorized

  def logged_in?
    @current_user = User.find(session[:user_id])
  end

  def authorized
    render json: { errors: ["Please log in"] }, status: :unauthorized unless logged_in?
  end
end
