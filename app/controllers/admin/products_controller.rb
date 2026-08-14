class Admin::ProductsController < Admin::BaseController

  def index
    @categories = Category.all
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Created Successfully"
      redirect_to admin_products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      flash[:notice] = "Updated Successfully"
      redirect_to admin_products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:notice] = "Product Deleted"
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :price, :stock)
  end
end
