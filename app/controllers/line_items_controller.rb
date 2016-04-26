class LineItemsController < ApplicationController

  def index
    @line_items = LineItem.all
  end

  def create
    if !current_user.nil? && current_user.current_cart.nil? 
      current_user.current_cart = Cart.create(user_id: current_user.id, status: "not submitted")
    end
    @item = Item.find(params[:item_id])
    current_cart.add_item(@item)
    
    current_user.current_cart.items << @item unless current_user.current_cart.items.include?(@item)
    redirect_to cart_path(current_cart)
  end


end
