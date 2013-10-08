class LocationsController < ApplicationController
  before_filter :load_user

  def index
    @location = @user.locations
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = @user.locations.build
  end

  def create
    @location = @user.locations.build(location_params)

    if @location.save
      redirect_to @location, notice: 'Location added.'
    else
      redirect_to :root, notice: 'There was an error.'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to :root
  end

  private
  def load_user
    @user = User.find(params[:user_id])
  end

  def location_params
    params.require(:location).permit(:address, :phone_number)
  end
end