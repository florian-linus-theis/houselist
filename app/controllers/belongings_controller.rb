# frozen_string_literal: true

class BelongingsController < ApplicationController
  before_action :set_flat, only: %i[new create]

  def show
    @belonging = Belonging.find(params[:id])
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

  def update
    @belonging = Belonging.find(params[:id])
    @belonging.update(belonging_params)
    redirect_to belonging_path(@belonging)
  end

  def destroy
    @belonging = Belonging.find(params[:id])
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
