# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[update destroy]
  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    @todo.belonging = Belonging.find(params[:belonging_id])
    if @todo.save
      redirect_to flat_belonging_path(@belonging)
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
    params.require(:todo).permit(:description, :status, :description, photos: [], files: [])
  end
end
