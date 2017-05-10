class HomeController < ApplicationController

  before_action :set_order_item, only: [:toggle, :complete]

  def home
    @unshipped_orders = Order.not_shipped.chronological
    @unshipped_orders.each do |us_order|
      @unshipped_items = us_order.order_items.unshipped
    end

    @need_reorder = Item.need_reorder.alphabetical

    if logged_in?
      @user = current_user
      @past_orders = @user.orders.chronological
      @past_orders.each do |past_order|
        @past_order_items = past_order.order_items
      end
    end
  end

  def about
  end

  def contact
  end

  def privacy
  end
  
end