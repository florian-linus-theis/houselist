# frozen_string_literal: true

class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show update destroy]

  def index
    @flats = policy_scope(Flat)
    @flat = Flat.new
    # authorize @flat
  end

  def show
    if params[:query].present?
      @belongings = Belonging.query_belonging(params[:query]).select { |b| b.flat_id == @flat.id }
    else
      @belongings = @flat.belongings
    end
    @belonging = Belonging.new
    @belongings_attention = @belongings.reject do |belonging|
      (belonging.good? || belonging.todos.count.zero?)
    end
    @notifications = Notification.includes(:belonging).where(belonging: { flat: @flat }, read: false)
                                 .order(created_at: :desc)

    @todo = Todo.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save
      redirect_to flats_path, notice: 'You created a new flat!'
    else
      redirect_to flats_path, alert: 'Sorry something went wrong...'
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

  def find_tenant
    # return unless params[:query]
    @flat = Flat.all.first
    @users = User.find_tenant(params[:query]).select(&:tenant?).first(5)
    authorize @flat
    render json: { users: @users }
  end

  def add_tenant
    user = User.find_tenant(params[:query]).first
    @flat = Flat.find(params[:flat_id])
    authorize @flat
    if Tenant.create(user:, flat: @flat)
      render json: { message: "Tenant added to flat", success: true }, status: :ok
    else
      render json: { error: "Tenant could not be added to flat", success: false }, status: :not_found
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:address, :name, photos: [])
  end
end
