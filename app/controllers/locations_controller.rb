class LocationsController < ApplicationController
  before_filter :get_business, except: [:index]
  before_filter :get_location, only: [:show, :edit, :update, :destroy]

  def index
    @location = current_user.locations
  end

  def show
    gon.lat = @location.latitude
    gon.lng = @location.longitude
  end

  def new
    @location = @business.locations.build
  end

  def create
    @location = @business.locations.build(location_params)

    if @location.save
      redirect_to business_location_path(@business, @location), notice: 'Location added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update_attributes(location_params)
      redirect_to business_location_path(@business, @location)
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path, notice: "Location deleted!"
  end

  private
  def get_business
    @business = Business.find(params[:business_id])
    raise "None of your business... pun intended." if @business.user_id != current_user.id
  end

  def get_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:location_name, :address, :phone_number)
  end
end