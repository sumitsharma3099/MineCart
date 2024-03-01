# app/controllers/carts_controller.rb

class CartsController < ApplicationController
  before_action :authenticate_user!

  # Adds a product to the user's cart
  def add_product
    @product = Product.find(params[:id])
    current_user.add_to_cart(@product)
    redirect_to user_root_path, notice: 'Product added to cart.'
  end

  # Displays the user's cart items
  def index
    @cart_items = current_user.pending_cart_items
  end

  # Removes a product from the user's cart
  def destroy
    @cart_item = current_user.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path, notice: 'Product removed from cart successfully.'
  end

  # Places an order for the items in the user's cart
  def place_order
    current_user.cart_items.update_all(order_completed: true)
    redirect_to user_root_path, notice: 'Order Placed successfully.'
  end
end
