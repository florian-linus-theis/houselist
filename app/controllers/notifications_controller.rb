# frozen_string_literal: true

class NotificationsController < ApplicationController
  def update
    @notification = Notification.find(params[:id])
    authorize @notification
    @notification.update(read: true)
    flat = @notification.belonging.flat
    redirect_to flat_path(flat)
  end
end
