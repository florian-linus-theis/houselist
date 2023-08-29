# frozen_string_literal: true

class BelongingsController < ApplicationController

  def show
    @beloninging = Belonging.find(params[:id])
    #what are
  end

  def create

  end
end
