class UsersController < ApplicationController

    def create

    end

    def show

    end

    private

    def user_params
        params.permit(:username, :password, :email)
    end
end
