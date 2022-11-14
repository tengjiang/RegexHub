class SessionsController < ApplicationController
    # do not need to define login, no params need to be passed
    def create
        @user = User.find_by(username: params[:username])
        message = nil

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            # redirect_to user_path
            redirect_to regexes_path
            return
        elsif !@user
            message = "User does not exist."
        else
            message = "Wrong password!"
        end
        flash[:notice] = message
        redirect_to login_path
    end
    def destroy
        session[:user_id] = nil
        session[:tags] = nil
        redirect_to regexes_path
    end
end