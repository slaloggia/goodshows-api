class NotificationsController < ApplicationController

    def index
        notifications = Notification.where(recipient_id: params[:recipient_id], read: false)
        render json: notifications
    end

end
