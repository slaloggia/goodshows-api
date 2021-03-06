class CommentsController < ApplicationController

    def index 
        comments = Comment.all
        render json: comments
    end
    
    def create
        comment = Comment.create(comment_params)
        create_notification(comment_params)
        render json: comment
    end

    private 
    def comment_params
        params.require(:comment).permit(:user_id, :review_id, :content)
    end

    def create_notification(comment_params)
        review = Review.find(comment_params[:review_id])
        actor = User.find(comment_params[:user_id])
        recipient = User.find(review.user_id)
        Notification.create(recipient_id: recipient.id, actor_id: actor.id, read: false, action: 'commented', notifiable_id: review.id, notifiable_type: 'Review' )
    end
end
