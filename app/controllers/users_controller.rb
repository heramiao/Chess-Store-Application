class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]  # user can never be destroyed

    def index
    end

    def show 
    end

    def new
        @user = User.new 
    end

    def edit
        if logged_in?
            @user = current_user
        else
            redirect_to home_path, notice: "Do not have access to edit user"
        end
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to home_path, notice: "You have successfully signed up!"
        else
            flash[:error] = "This user could not be created."
            render "new"
        end
    end

    def update
        if logged_in?
            @user = current_user
            if @user.update_attributes(user_params)
                flash[:notice] = "#{@user.proper_name} has been updated."
                redirect_to @user
            else
                render :action => 'edit'
            end
        else
            redirect_to home_path, notice: "Do not have access to update user'"
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone, :username, :password, :password_confirmation, :role, :active)
    end

    def set_user 
        @user = User.find(params[:id])
    end

end