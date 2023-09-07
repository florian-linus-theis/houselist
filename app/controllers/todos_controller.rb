# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[update destroy]

  def create
    @todo = Todo.new(todo_params)
    belonging = Belonging.find(params[:belonging_id])
    @todo.user = current_user
    @todo.belonging = belonging
    authorize @todo
    raise
    if @todo.save && belonging.update(status: @todo.belonging_status)
      create_notification(belonging, @todo) if current_user.tenant?
      redirect_to flat_path(belonging.flat), notice: 'Created report!'
    else
      render 'flats/show', status: :unprocessable_entity
    end
  end

  def update
    authorize @todo
    if @todo.belonging.update(status: 'good') && @todo.update(status: 'archived')
      redirect_to flat_path(@todo.belonging.flat), notice: 'Todo is done! 🎉'
    else
      render 'flats/show', status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def create_notification(belonging, todo)
    n = Notification.new
    n.belonging = belonging
    n.todo = todo
    n.user = current_user
    n.description = "#{n.user.first_name} #{n.user.last_name} reported: #{n.todo.description}"
    n.save
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:description, :status, :belonging_status, :description, photos: [], files: [])
  end
end
