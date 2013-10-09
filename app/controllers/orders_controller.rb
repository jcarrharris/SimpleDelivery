class OrdersController < ApplicationController
  before_filter :get_business, :get_location
  before_filter :get_order, only: [:show, :edit, :update, :destroy]

  def index
    @order = @location.orders
  end

  def show
  end

  def new
    @order = new Order
  end

  def create
    @location = current_user.locations.where(id: params[:order][:location_id]).first!
    @order = @location.orders.build(order_params)

    if @order.save
      redirect_to user_business_location_orders_path(@user, @business, @location), notice: 'Order added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to user_business_location_order_path(@user, @business, @location, @order)
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to user_business_location_orders_path(@user, @business, @location)
  end

  private
  def get_business
    @business = Business.find(params[:business_id])
    raise "None of your business... pun intended." if @business.user_id != current_user.id
  end

  def get_location
    @location = Location.find(params[:location_id])
  end

  def get_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:tracking_number, :delivery_address, :phone_number, :length, :width, :height, :weight, :quantity, :declared_value, :packaging, :pickup_time, :delivery_time, :status)
  end
end