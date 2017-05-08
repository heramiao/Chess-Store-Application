class OrderItemsController < ApplicationController

    before_action :set_order_item, only: [:show, :edit, :update, :delete, :shipped]
    authorize_resource

    def index
    end

    def show 
    end

    def new
    end

    def edit 
        if !params[:status].nil? && params[:status] == 'completed'
            @task.completed = true
            @task.completed_by = current_user.id
            @task.save!
            flash[:notice] = "#{@task.name} has been marked complete."
            if params[:from] == 'project'
                redirect_to project_path(@task.project)
            else
                redirect_to tasks_path
            end
        end
    end

    def create
    end

    def update 
    end

    def destroy
    end

    # New methods to handle changing shipped field
    def shipped
        # set completed and completed_by fields
        @order_item.shipped
        #@task.completed_by = current_user.id

        if @order_item.save!
        flash[:notice] = 'Order item was marked as completed.'
        if params[:status] == "shipped"
            redirect_to task_path(@task)
        else
            redirect_to home_path
        end
        else
        render :action => "edit"
        end
    end

    private
    def set_order_item
        @order_item = OrderItem.find(params[:id])
    end

end