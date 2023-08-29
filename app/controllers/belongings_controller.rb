# frozen_string_literal: true

class BelongingsController < ApplicationController

  def show
    @beloninging = Belonging.find(params[:id])
  end

  def create
    
  end
end
