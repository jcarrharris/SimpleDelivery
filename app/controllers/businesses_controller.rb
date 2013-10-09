class BusinessesController < ApplicationController
  before_filter :get_business, only: [:show, :edit, :update, :destroy]

  def index
    @business = current_user.businesses
  end

  def show
  end

  def new
    @business = current_user.businesses.build
  end

  def create
    @business = current_user.businesses.build(business_params)

    if @business.save
      redirect_to businesses_path, notice: 'Business added.'
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
    redirect_to businesses_path
  end

  private
  def get_business
    @business = Business.find(params[:id])
    raise "None of your business... pun intended." if @business.user_id != current_user.id
  end

  def business_params
    params.require(:business).permit(:business_name, :website_url, :phone_number)
  end
end