class LocationsController < ApplicationController
  before_filter :get_user, :get_business
  before_filter :get_location, :only => [:show, :edit, :update, :destroy]

  def index
    @location = @business.locations
  end

  def show
  end

  def new
    @location = @business.locations.build
  end

  def create
    @location = @business.locations.build(location_params)

    if @location.save
      redirect_to user_business_locations_path(@user, @business), notice: 'Location added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update_attributes(location_params)
      redirect_to user_business_location_path(@user, @business, @location)
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to user_business_locations_path(@user, @business)
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def get_business
    @business = Business.find(params[:business_id])
  end

  def get_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:location_name, :address, :phone_number)
  end
end