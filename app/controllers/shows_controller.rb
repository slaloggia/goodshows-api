class ShowsController < ApplicationController

    def index
        shows = Show.all
        render json: ShowSerializer.new(shows).to_serialized_json
    end

    def show
        show = Show.find(params[:id])
        render json: ShowSerializer.new(show).to_serialized_json
    end 
end
