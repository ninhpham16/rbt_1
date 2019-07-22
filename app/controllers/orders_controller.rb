class OrdersController < ApplicationController
  before_action :find_movie_theater, only: %i[new]
  
  def new
    identify_room
    @order = Order.new
    @order.order_items.build
  end

  def create
    @order = Order.new order_params
    if @order.save && @order.order_items.present?
      flash[:success] = "Success"
      redirect_to @order
    else
      redirect_to new_order_path(movie_theater_id: 
        params[:order][:order_items_attributes]['0'][:movie_theater_id])
    end
  end

  def show
    @order = Order.find params[:id]
    @order_items = @order.order_items
  end

  def index
    @orders = Order.all.order(created_at: :desc).page(params[:page]).per Settings.per_page_orders
  end 

private
  def order_params
    params.require(:order).permit(:user_id,
     order_items_attributes: [:id, :movie_theater_id, :order_id, :seat_id])
  end

  def find_movie_theater
    @movie_theater = MovieTheater.find params[:movie_theater_id]
  end

  def identify_room
    @room = @movie_theater.room
    @seats = @room.seats.pluck(:id, :name, :available)
  end
end
