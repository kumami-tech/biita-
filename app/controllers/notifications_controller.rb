class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    notifications = current_user.passive_notifications
    notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    @notifications = notifications.where.not(visitor_id: current_user.id)
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    redirect_to notifications_path
  end

  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end
end
