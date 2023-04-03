class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  skip_before_action :authorized, only: [:create]
  wrap_parameters format: []

  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id
    render json: @user, status: :created
  end

  def show
    @user = User.find(session[:user_id])
    render json: @user, serializer: TodoUserSerializer, status: :ok
  end

  private

  def user_params
    params.permit(:email, :image, :password, :password_confirmation)
  end

  def render_user_not_found_response
    render json: { errors: ["User not found"] }, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: {
             email: invalid.record.errors.full_messages_for(:email),
             password: invalid.record.errors.full_messages_for(:password),
             password_confirmation: invalid.record.errors.full_messages_for(:password_confirmation),
           }, status: :unprocessable_entity
  end
end
