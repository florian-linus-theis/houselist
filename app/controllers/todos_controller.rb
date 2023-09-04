# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[update destroy]
  def create
    @todo = Todo.new(todo_params)
    belonging = Belonging.find(params[:belonging_id])
    @todo.user = current_user
    @todo.belonging = belonging
    authorize @todo
    if @todo.save && belonging.update(status: @todo.belonging_status)
      redirect_to flat_path(belonging.flat), notice: 'Created report!'
    else
      render 'flats/show', status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:description, :status, :belonging_status, :description, photos: [], files: [])
  end
end
