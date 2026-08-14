class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @products = @category.products
  end
end
