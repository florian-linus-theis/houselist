# frozen_string_literal: true

class NotificationsController < ApplicationController
  def update
    notification = Notification.find(params[:id])
    authorize notification
    if notification.update(read: true)
      render json: { message: "Notification marked as read", success: true }, status: :ok
    else
      render json: { error: "Notification not marked as read", success: false }, status: :not_found
    end
  end
end
