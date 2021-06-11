class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
        render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        if @user != current_user
            flash[:message] = "You are not authorize to this user"
            redirect_to user_path(current_user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
