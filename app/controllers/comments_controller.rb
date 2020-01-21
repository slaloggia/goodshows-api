class CommentsController < ApplicationController

    def index 
        comments = Comment.all
        render json: comments
    end
    
    def create
        comment = Comment.create(comment_params)
        byebug 
        review = Review.find(params[:review_id])
        actor = User.find(params[:user_id])
        recipient = User.find(review.user_id)
        Notification.create(recipient_id: recipient.id, actor_id: actor.id, read: false, action: 'commented', notifiable_id: review.id, notifiable_type: 'Review' )
        render json: comment
    end

    private 
    def comment_params
        params.require(:comment).permit(:user_id, :review_id, :content)
    end
end
