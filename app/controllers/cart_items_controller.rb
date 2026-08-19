class CartItemsController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i

    cart_item = current_cart.cart_items.find_or_initialize_by(product_id: product.id)
    cart_item.quantity = quantity
    cart_item.save!

    redirect_to product_path(product.id), notice: 'Product added to cart'
  end

  def update
    cart_item = CartItem.find_by(id: params[:id])
    if cart_item.update(quantity: params[:quantity].to_i)
      redirect_to cart_path, notice: 'Quantity updated'
    else
      redirect_to cart_path, notice: cart_item.errors.full_messages.to_s
    end
  end

  def destroy
    cart_item = CartItem.find_by(id: params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: 'Product removed from cart'
  end
end
