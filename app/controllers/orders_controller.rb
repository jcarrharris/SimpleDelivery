class OrdersController < ApplicationController
  before_filter :authenticate_user!, except: :track
  helper_method :sort_column, :sort_direction
  before_filter :get_business, :get_location, except: [:index, :courier, :status, :track]
  before_filter :get_order, only: [:show, :edit, :update, :destroy]
  before_filter :new_order, only: :create # CanCan strong params incompatibility workaround
  load_and_authorize_resource

  def index
    @location = current_user.locations if current_user.role == "Merchant"
    @order = Order.all if current_user.role == "Courier"
    @orders = Order.order("tracking_number")
  end

  def show
  end

  def new
    @order = @location.orders.build
  end

  def create
    @order = @location.orders.build(order_params)
    @order.tracking_number = SecureRandom.hex(5)
    @order.status = "Pending"
    @order.pickup_time = (params[:pickup_date] + " " + params[:pickup_hour]).to_datetime
    @order.delivery_time = (params[:delivery_date] + " " + params[:delivery_hour]).to_datetime
    @order.phone_number = (params[:phone_number]).gsub(/\D/, '').to_i

    if @order.save
      UserMailer.tracking_email(@order).deliver
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

  def courier
    if @order.user_id == nil
      @order.update_attribute(:user_id, current_user.id)
      redirect_to orders_path, notice: "Passed!"
    else
      redirect_to orders_path, notice: "Failed!"
    end
  end

  def status
    if @order.update_attributes(order_params)
      if @order.status == "Delivered"
        UserMailer.delivered_email(@order.location.business.user, @order.user).deliver
      end
      redirect_to orders_path
    end
  end

  def track
    @order = Order.where(:tracking_number => params[:tracking_number]).first
    @business = @order.location.business
    @location = @order.location
    render :show
  end

  private
  def get_business
    @business = Business.find(params[:business_id])
    if current_user.role != "Courier"
      raise "None of your business... pun intended." if @business.user_id != current_user.id
    end
  end

  def sort_column
    Order.column_names.include?(params[:sort]) ? params[:sort] : "tracking_number"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def get_location
    @location = Location.find(params[:location_id])
  end

  def get_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:tracking_number, :delivery_address, :phone_number, :length, :width, :height, :weight, :quantity, :declared_value, :packaging, :pickup_time, :delivery_time, :status, :email)
  end

  def new_order
    @order = @location.orders.build(order_params)
  end
end