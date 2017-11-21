class CartsController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @cart = Cart.find_by(id: params[:id])
  end



  def checkout
    @current_cart = current_user.current_cart
    @current_cart.line_items.each do |line_item|
      # item = Item.find_by(id: line_item.item_id)
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    @current_cart.status = "submitted"
    @current_cart.save
    # get back in global mode...
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@current_cart)
  end


end
