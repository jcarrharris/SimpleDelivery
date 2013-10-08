class BusinessesController < ApplicationController
  before_filter :get_user
  before_filter :get_business, :only => [:show, :edit, :update, :destroy]

  def index
    @business = @user.businesses
  end

  def show
  end

  def new
    @business = @user.businesses.build
  end

  def create
    @business = @user.businesses.build(business_params)

    if @business.save
      redirect_to user_businesses_path(@user), notice: 'Business added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @business.update_attributes(business_params)
      redirect_to user_business_path(@user, @business)
    else
      render :edit
    end
  end

  def destroy
    @business.destroy
    redirect_to user_businesses_path(@user)
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def get_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:business_name, :website_url, :phone_number)
  end
end