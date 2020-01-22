class NotificationsController < ApplicationController

    def index
        notifications = Notification.where(recipient_id: params[:recipient_id], read: false)
        render json: notifications
    end

    def destroy
        notification = Notification.find(params[:id])
        notification.destroy
        render json: notification
    end

end
