class OrdersController < ApplicationController
  before_filter :get_business, :get_location, except: [:index]
  before_filter :get_order, only: [:show, :edit, :update, :destroy]

  def index
    @order = current_user.orders
  end

  def show
  end

  def new
    @order = @location.orders.build
  end

  def create
    @order = @location.orders.build(order_params)
    @order.tracking_number = SecureRandom.hex(10)

    if @order.save
      redirect_to business_location_order_path(@business, @location, @order), notice: 'Order added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to business_location_order_path(@business, @location, @order)
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: "Order deleted!"
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