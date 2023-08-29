# frozen_string_literal: true

class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show update destroy]

  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    @flats = policy_scope(Flat)
  end

  def show
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @flat
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat), notice: 'Updated the flat details!'
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @flat
  end

  def destroy
    @flat.destroy
    redirect_to flat_path(@flat)
    authorize @flat
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:address)
  end
end
