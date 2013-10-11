class BusinessesController < ApplicationController
  before_filter :get_business, only: [:show, :edit, :update, :destroy]
  before_filter :new_business, only: :create # CanCan strong params incompatibility workaround
  load_and_authorize_resource

  def index
    @business = current_user.businesses
    redirect_to business_path(current_user.businesses.first) if @business.count == 1
  end

  def show
  end

  def new
    @business = current_user.businesses.build
  end

  def create
    @business = current_user.businesses.build(business_params)

    if @business.save
      redirect_to business_path(@business), notice: 'Business added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @business.update_attributes(business_params)
      redirect_to business_path(@business)
    else
      render :edit
    end
  end

  def destroy
    @business.destroy
    redirect_to businesses_path, notice: "Business deleted!"
  end

  private
  def get_business
    @business = Business.find(params[:id])
    raise "None of your business... pun intended." if @business.user_id != current_user.id
  end

  def business_params
    params.require(:business).permit(:business_name, :website_url, :phone_number, :image)
  end

  def new_business # CanCan strong params incompatibility workaround
    @business = current_user.businesses.build(business_params)
  end
end