class OrdersController < ApplicationController
  def show
    @order = Order.find params[:id]
    @order_items = @order.order_items
  end

  def index
    @orders = Order.all.order(created_at: :desc).page(params[:page]).per Settings.per_page_orders
  end 
end
