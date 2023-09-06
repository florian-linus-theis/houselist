# frozen_string_literal: true

class BelongingsController < ApplicationController
  include BelongingsHelper
  before_action :set_flat, only: %i[show update create new destroy]

  def show
    @belonging = Belonging.find(params[:id])
    @active_todo = Todo.where(belonging_id: @belonging.id, status: 'active')[0]
    authorize @belonging
  end

  def new
    @belonging = Belonging.new
    authorize @belonging
  end

  def create
    @belonging = Belonging.new(belonging_params)
    @belonging.flat = @flat
    authorize @belonging
    if @belonging.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @belonging = Belonging.find(params[:id])
    @flat = @belonging.flat
    render file: 'public/401.html', status: :unauthorized unless authorize @belonging
  end

  def update
    @belonging = Belonging.find(params[:id])
    authorize @belonging

    selected_room = params[:selected_room].split.map(&:downcase).join(" ")
    # Deleting previous photos
    @belonging.photos.each(&:purge) if @belonging.photos.attached?

    # Find or create the Category based on the selected_room
    category = Category.find_or_create_by(name: selected_room)

    # Assign the Category object to the @belonging.category
    @belonging.category = category

    if @belonging.update(belonging_params)
      redirect_to flat_belonging_path(@belonging), notice: 'Updated the details'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @belonging = Belonging.find(params[:id])

    # Deleting photos
    @belonging.photos.each(&:purge) if @belonging.photos.attached?
    @belonging.destroy
    authorize @belonging
    redirect_to flat_path(@belonging.flat), status: :see_other
  end

  private

  def belonging_params
    params.require(:belonging).permit(:name, :status, :description, photos: [], files: [])
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end
end
