class OrderItemsController < ApplicationController

    before_action :set_order_item, only: [:show, :edit, :update, :destroy, :ship_item]
    authorize_resource

    def index
    end

    def show 
    end

    def new
    end

    def edit 
    end

    def create
    end

    def update 
    end

    def destroy
    end

    def ship_item 
        @order_item.shipped
        @order_item.save
        @unshipped_orders = Order.not_shipped.chronological
        @unshipped_orders.each do |us_order|
            @unshipped_items = us_order.order_items.unshipped
        end
    end 

    private
    def set_order_item
        @order_item = OrderItem.find(params[:id])
    end

end