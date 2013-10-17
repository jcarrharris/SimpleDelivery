class RatingsController < ApplicationController
  before_filter :authenticate_user!, :get_user

  def show
    @rating = Rating.find(params[:id])
  end

  def create
    @rating = @user.ratings.build(rating_params)
    @rating.user_id = @user.id

    if @rating.save
      redirect_to :root, notice: 'Rating added!'
    else
      redirect_to user_path(@user.id), notice: 'Error!'
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to user_path(@user.id)
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def rating_params
    params.require(:rating).permit(:rate)
  end
end