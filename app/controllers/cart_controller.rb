class CartController < ApplicationController
    include ChessStoreHelpers::Cart
    
    def index
        @cart_items = get_list_of_items_in_cart
    end

end