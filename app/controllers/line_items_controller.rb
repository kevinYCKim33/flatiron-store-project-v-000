class LineItemsController < ApplicationController
  def create
    if current_user.current_cart == nil
      current_user.current_cart = current_user.carts.build
    end
      current_user.current_cart.add_item(params[:item_id]).save
      if current_user.save
        redirect_to cart_path(current_user.current_cart), {notice: 'Item added to cart!'}
      else
        redirect_to store_path, {notice: 'Unable to add item'}
      end
  end
end
