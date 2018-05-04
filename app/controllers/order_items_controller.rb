class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.save
    session[:order_id] = @order.id
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js { render :file => "layouts/cart_total.js.erb" }
    end
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
  end

  def destroy
    @order_items = current_order.order_items
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    session[:order_id] = @order.id
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js { render :file => "carts/show.js.erb" }
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
