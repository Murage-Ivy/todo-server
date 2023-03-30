class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  skip_before_action :authorized, only: [:create]
  #   wrap_parameters format: []

  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id
    render json: @user, status: :created
  end

  def show
  end

  private

  def user_params
    params.permit(:email, :image, :password, :password_confirmation)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
