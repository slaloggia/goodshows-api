class ReviewsController < ApplicationController

    def index
        reviews = Review.all
        render json: ReviewSerializer.new(reviews).to_serialized_json
    end

    def create
        puts params
        review = Review.create(review_params)
        render json: ReviewSerializer.new(review).to_serialized_json
    end

    private
    def review_params
        params.require(:review).permit(:show_id, :user_id, :content, :rating)
    end
end
