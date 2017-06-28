class NotificationsController < ApplicationController
  def show
    @notification = Notification.find(params[:id])
    @notification.mark_as_read

  end
end
