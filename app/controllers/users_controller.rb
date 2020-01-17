class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.create(user_params)
        # byebug
        if user
            token = JWT.encode({user_id: user.id}, GoodShowsApi::Application.credentials.auth_secret, 'HS256')
            render json: { id: user.id, username: user.username,  token: token }
        else
            render json: user.errors
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        user.save 
        render json: user
    end

    def avatar
        user = User.find_by(id: params[:id])
      
        if user&.avatar&.attached?
          redirect_to rails_blob_url(user.avatar)
        else
          head :not_found
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :avatar, :password, :password_confirmation)
    end
end
