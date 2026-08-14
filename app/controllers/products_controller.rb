class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.where(category_id: @categories.ids)
    if params[:category_id]
      @products = @products.where(category_id: params[:category_id])
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
