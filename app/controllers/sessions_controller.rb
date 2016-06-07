class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email])
        if user and user.authenticate(params[:session][:password])
            flash[:success] = "Welcome #{user.username}" # For the upcoming request
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Please check your login credentials" # For the current view
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "Successfully Signed out"
        redirect_to root_path
    end
end