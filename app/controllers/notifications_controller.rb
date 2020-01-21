class NotificationsController < ApplicationController

    def index
        notifications = Notification.all
        render json: notifications_controller
    end
end
