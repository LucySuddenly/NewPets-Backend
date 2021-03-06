class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token(user_id: user.id)
            render json: {user: user, jwt: token}
        else
            render json: {message: "User creation was unsuccessful."}
        end

    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    private

    def user_params
        params.permit(:username, :password, :email)
    end
end
