class TodosController < ApplicationController
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
end
