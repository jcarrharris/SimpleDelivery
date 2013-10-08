class BusinessesController < ApplicationController
  before_filter :get_user

  def index
    @business = @user.businesses
  end

  def show
    @business = Business.find(params[:id])
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
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      redirect_to user_business_path(@user, @business)
    else
      render :edit
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to :root
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def business_params
    params.require(:business).permit(:business_name, :website_url, :phone_number)
  end
end