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
    end

    def update 
    end

    def destroy
    end

    private
    def set_order
      @order = Order.find(params[:id])
    end

end