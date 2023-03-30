class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.index
    render json: @user, status: :created
  end

  def show
  end

  private

  def user_params
    params.permit(:email, :image, :password, :password_confirmation)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.errors.full_message }, status: :unprocessable_entity
  end
end
