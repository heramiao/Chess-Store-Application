class HomeController < ApplicationController
  def home
    @unshipped_orders = Order.not_shipped.chronological
    @unshipped_orders.each do |us_order|
      @unshipped_items = us_order.order_items.unshipped
    end
    @need_reorder = Item.need_reorder.alphabetical
  end

  def about
  end

  def contact
  end

  def privacy
  end
  
end