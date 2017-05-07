class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]  # user can never be destroyed
    authorize_resource

    def customer_index
        @active_customers = User.active.customers.alphabetical.paginate(:page => params[:page]).per_page(10)
        @inactive_customers = User.inactive.customers.alphabetical.paginate(:page => params[:page]).per_page(10)
    end

    def employee_index
        @active_employees = User.active.employees.alphabetical.paginate(:page => params[:page]).per_page(10)
        @inactive_employees = User.inactive.employees.alphabetical.paginate(:page => params[:page]).per_page(10)
    end

    def show 
    end

    def new
        @user = User.new 
    end

    def edit
        # Handle shortcut deactivations
        unless params[:status].nil?
        if params[:status].match(/deactivate/) # == 'deactivate_prj' || params[:status] == 'deactivate_asgn'
            @user.update_attribute(:active, false)
            flash[:notice] = "#{@user.name} was made inactive."
        elsif params[:status].match(/activate/) # == 'activate_prj' || params[:status] == 'activate_asgn'
            @user.update_attribute(:active, true)
            flash[:notice] = "#{@user.name} was made active."
        end
        redirect_to employee_index_path if params[:status].match(/_user/)
        end
    end 

    def edit_current_user
        puts "edit_current_user"
        if logged_in?
            @user = current_user
        else
            redirect_to home_path, notice: "Do not have access to edit current user"
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