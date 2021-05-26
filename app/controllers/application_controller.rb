class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def if_not_logged_in_redirect
        redirect_to '/' if !logged_in?
    end



end
