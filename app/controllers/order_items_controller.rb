class OrderItemsController < ApplicationController

    before_action :set_order_item, only: [:show, :edit, :update, :delete]
    authorize_resource

    def index
        #@unshipped_items = OrderItem.unshipped
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

end