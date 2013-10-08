class OrdersController < ApplicationController
  before_filter :get_user, :get_business, :get_location
  before_filter :get_order, :only => [:show, :edit, :update, :destroy]

  def index
    @order = @location.orders
  end

  def show
  end

  def new
    @order = @location.orders.build
  end

  def create
    @order = @location.orders.build(order_params)

    if @order.save
      redirect_to user_business_orders_path(@user, @business), notice: 'Order added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to user_business_order_path(@user, @business, @order)
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to user_business_orders_path(@user, @business)
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def get_business
    @business = Business.find(params[:business_id])
  end

  def get_location
    @location = Location.find(params[:location_id])
  end

  def get_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_name, :address, :phone_number)
  end
end