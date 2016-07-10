class UsersController < ApplicationController

    before_action :set_user, only: [:edit,:update,:show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]
    before_action :verify_current_user_credentials, only: [:update]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to alpha-blog #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success] = "Account information updated"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def show
        @user_articles = @user.articles.paginate(page: params[:page], per_page: 3)
    end

    def index
        @users = User.paginate(:page => params[:page], :per_page => 3)
    end


    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:success] = "All articles and user information have been deleted"
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def verify_current_user_credentials
      unless @user.authenticate(params[:user][:password]) #|| current_user.admin?
        flash[:danger] = "Current Password in incorrect."
        render 'edit'
      end
    end

    def require_same_user
        if current_user != @user and !current_user.admin?
            flash[:danger] = "You are not authorized"
            redirect_to root_path
        end
    end

    def require_admin
        if logged_in? and !current_user.admin?
            flash[:danger] = "Only admin can access that action"
            redirect_to root_path
        end
    end
end
