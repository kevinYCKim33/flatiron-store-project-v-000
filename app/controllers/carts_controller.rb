class CartsController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  def checkout
    @current_cart = @user.current_cart
    redirect_to cart_path(@current_cart)
  end

end
