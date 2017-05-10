class OrdersController < ApplicationController
    include ChessStoreHelpers::Cart

    before_action :set_order, only: [:show, :edit, :update, :destroy]
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
    
        if @order.save 
            save_each_item_in_cart(@order)
            redirect_to home_path, notice: "Successfully created order."
            clear_cart
        else
            render action: 'new'
        end
    end

    def update 
    end

    def destroy
        @order.destroy
        if logged_in? && current_user.role?(:customer)
            redirect_to home_path, notice: "Successfully destroyed order."
        else
            redirect_to orders_path, notice: "Successfully destroyed order."
        end
    end

    private
    def order_params
        params.require(:order).permit(:school_id, :user_id, :date, :grand_total, :credit_card_number, :expiration_year, :expiration_month, :payment_receipt)
    end

    def set_order
      @order = Order.find(params[:id])
    end

end