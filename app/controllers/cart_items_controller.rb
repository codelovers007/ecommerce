class CartItemsController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i

    cart_item = current_cart.cart_items.find_or_initialize_by(product_id: product.id)
    cart_item.quantity = quantity
    cart_item.save!

    redirect_to product_path(product.id), notice: 'Product added to cart'
  end

  def destroy
  end
end
