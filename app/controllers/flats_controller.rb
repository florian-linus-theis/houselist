# frozen_string_literal: true

class FlatsController < ApplicationController
  def index
    @flats = policy_scope(Flat)
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    redirect_to flat_path(@flat) if @flat.save

    render :new
  end

  def edit; end

  def show
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def update; end

  def destroy; end

  private

  def flat_params
    params.require(:flat).permit(:address)
  end
end
