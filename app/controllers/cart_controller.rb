class CartController < ApplicationController
    include ChessStoreHelpers::Cart
    include ChessStoreHelpers::Shipping

    before_action :set_item, only: [:add_to_cart, :remove_from_cart]
    
    def index
        @cart_items = get_list_of_items_in_cart
        @subtotal = calculate_cart_items_cost
        @shipping_costs = calculate_cart_shipping
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

    def add_to_cart
        add_item_to_cart(@item.id.to_s)
        redirect_to :back
    end

    def remove_from_cart
        remove_item_from_cart(@item.id.to_s)
        redirect_to :back
    end

    private 
    def set_item
        @item = Item.find(params[:id])
    end

end