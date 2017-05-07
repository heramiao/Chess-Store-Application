class OrdersController < ApplicationController

    before_action :set_order, only: [:show, :edit, :update, :delete]
    authorize_resource

    def index
        @all_orders = Order.chronological.all.paginate(:page => params[:page]).per_page(10)
    end

    def show 
        @order_items = @order.order_items
    end

    def new
        @order = Order.new
    end

    def edit 
    end

    def create
        @order = Order.new(order_params)
    
        if @order.save!
            redirect_to home_path, notice: "Successfully created #{@item.name}."
        else
            render action: 'new'
        end
    end

    def update 
    end

    def destroy
    end

    private
    def order_params
        params.require(:order).permit(:school_id, :user_id, :date, :grand_total, :credit_card_number, :expiration_year, :expiration_month, :payment_receipt)
    end

    def set_order
      @order = Order.find(params[:id])
    end

end