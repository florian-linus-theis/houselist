# frozen_string_literal: true

class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show update destroy]

  def index
    @flats = policy_scope(Flat)
  end

  def show
    @belongings = @flat.belongings
    @belonging = Belonging.new
    @belongings_attention = @belongings.reject do |belonging|
      (belonging.good? || belonging.todos.count.zero?)
    end

    # @notifications = @flat.notifications.select { |notification| notification.read == false }
    @notifications = Notification.includes(:belonging).where(belonging: { flat: @flat }, read: false)
                                 .order(created_at: :desc)

    @todo = Todo.new
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
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
    params.require(:flat).permit(:address, :name)
  end
end
