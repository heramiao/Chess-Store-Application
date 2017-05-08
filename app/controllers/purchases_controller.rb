class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.chronological.to_a
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.date = Date.current
    
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully made.' }
        @need_reorder = Item.need_reorder.alphabetical
        format.js 
      else
        render action: 'new'
      end
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:item_id, :quantity)
  end
  
end