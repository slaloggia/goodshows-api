class CommentsController < ApplicationController

    def index 
        comments = Comment.all
        render json: comments
    end
    
    def create
        review = Review.find(params[:review_id])
        actor = User.find(params[:user_id])
        recipient = User.find(review.user_id)
        comment = Comment.create(comment_params)
        Notification.create(recipient: recipient, actor: actor, read: false, action: 'commented', notifiable: review )
        render json: comment
    end

    private 
    def comment_params
        params.require(:comment).permit(:user_id, :review_id, :content)
    end
end
