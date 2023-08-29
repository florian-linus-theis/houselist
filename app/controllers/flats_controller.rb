# frozen_string_literal: true

class FlatsController < ApplicationController
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    @flats = policy_scope(Flat)
  end

  def create; end

  def edit; end

  def show; end

  def update; end

  def destroy; end

  private

  def flat_params
    params.require(:flat).permit(:address)
  end
end
