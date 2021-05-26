class SessionsController < ApplicationController
    
    def home
    end

    def destroy
        session.clear
        redirect_to "/"
    end

    def new
    end

    def create
        user = User.find_by(username:params[:user][:username].downcase)
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user) #"/users/#{user.id}"    <---- Long way
        else
            flash[:error] = "Incorrect login, try again"
             redirect_to "/login"
        end
    end

end