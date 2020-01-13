class ReviewsController < ApplicationController

    def index
        reviews = Review.all
        render json: ReviewSerializer.new(reviews).to_serialized_json
    end

    def show
        review = Review.find(params[:id])
        render json: ReviewSerializer.new(review).to_serialized_json
    end

    def create
        review = Review.create(review_params)
        render json: ReviewSerializer.new(review).to_serialized_json
    end

    def update
        review = Review.find(params[:id])
        review.update(review_params)
        review.save
        puts review
        render json: ReviewSerializer.new(review).to_serialized_json
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
        render json: ReviewSerializer.new(review).to_serialized_json
    end

    private
    def review_params
        params.require(:review).permit(:show_id, :user_id, :content, :rating)
    end
end
