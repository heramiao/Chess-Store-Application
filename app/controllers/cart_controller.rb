class CartController < ApplicationController
    include ChessStoreHelpers::Cart

    before_action :set_cart, only: [:show, :edit, :update, :destroy]
    
    def index
        @cart_items = Cart.get_list_of_items_in_cart
    end

    def show
        @cart_items = @cart.get_list_of_items_in_cart
    end

    def new
        @cart = Cart.create_cart
    end

    def edit
    end

    def create
    end

    def update
        @cart.add_item_to_cart(item_id)
        if @cart.update
            redirect_to cart_index_path, notice: "Successfully added item to cart"
        else
            render action: 'edit'
        end
    end

    def destroy
        @cart.destroy_cart
    end

    private 
    def set_cart
        @cart = Cart.create_cart
    end

end