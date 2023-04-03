class TodosController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_todo_not_found_response
  #   skip_before_action :authorized, only: [:index, :show]
  wrap_parameters format: []

  def index
    todos = Todo.all
    render json: todos, status: :ok
  end

  def show
    todo = find_todo
    render json: todo, status: :ok
  end

  def create
    todo = logged_in?.todos.create!(todo_params)
    render json: todo, status: :created
  end

  def destroy
    todo = find_todo
    todo.destroy
    head :no_content
  end

  def update
    todo = find_todo
    todo.update!(todo_params)
    render json: todo, status: :ok
  end

  private

  def find_todo
    Todo.find(params[:id])
  end

  def todo_params
    params.permit(:title, :description, :start_date, :end_date, :status)
  end

  def render_unprocessable_entity_response(invalid)
    render json: {
             title: invalid.record.errors.full_messages_for(:title),
             description: invalid.record.errors.full_messages_for(:description),
             start_date: invalid.record.errors.full_messages_for(:start_date),
             end_date: invalid.record.errors.full_messages_for(:end_date),
             status: invalid.record.errors.full_messages_for(:status),
           }, status: :unprocessable_entity
  end

  def render_todo_not_found_response
    render json: { errors: ["Todo not found"] }, status: :not_found
  end
end
