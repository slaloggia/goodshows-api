class UsersController < ApplicationController

    def index
        users = User.all
        render json: UserSerializer.new(users).to_serialized_json
    end

    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user).to_serialized_json
    end

    def create
        puts user_params
        user = User.create(user_params)
        # byebug
        if user
            token = JWT.encode({user_id: user.id}, 'secretkey', 'HS256')
            render json: { id: user.id, username: user.username,  token: token }
        else
            render json: user.errors
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
