class LocationsController < ApplicationController
  before_filter :get_business, :get_user

  def index
    @location = @business.locations
  end

  def show
    @location = Location.find(params[:id])
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
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      redirect_to user_business_location_path(@user, @business, @location)
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to :root
  end

  private
  def get_business
    @business = Business.find(params[:business_id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def location_params
    params.require(:location).permit(:location_name, :address, :phone_number)
  end
end