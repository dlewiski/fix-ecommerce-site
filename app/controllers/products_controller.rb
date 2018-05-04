class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    sleep 2
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def show
    @products = Product.all
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to '/'
    else
      render :new
    end
  end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to products_path
end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
