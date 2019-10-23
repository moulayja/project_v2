class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            redirect_to posts_path	
        else
            redirect_to new_user_path(@user)
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end 
end
