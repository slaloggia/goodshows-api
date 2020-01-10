class UserShowsController < ApplicationController

    def index
        user_shows = UserShow.all 
        render json: user_shows
    end

    def create
        user_show = UserShow.find_or_create_by(user_id: user_show_params[:user_id], show_id: user_show_params[:show_id])
        user_show.seen = user_show_params[:seen]
        user_show.save
        render json: user_show
    end

    private

    def user_show_params
        params.require(:user_show).permit(:user_id, :show_id, :seen)
    end
end
