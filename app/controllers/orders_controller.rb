class OrdersController < ApplicationController

    before_action :set_order, only: [:show, :edit, :update, :delete]
    authorize_resource

    def index
        #@unshipped_orders = Order.not_shipped.chronological
    end

    def show 
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

end