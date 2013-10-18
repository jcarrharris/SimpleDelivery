class RatingsController < ApplicationController
  before_filter :authenticate_user!, :get_user

  def create
    @rating = @user.ratings.new
    @rating.rate = params[:score]
    @rating.user_id = @user.id

    respond_to do |format|
      if @rating.save
        format.html { redirect_to user_path(@user.id), notice: 'Rating added!' }
        format.json { render :json => { average_rating: @user.average_rating, count: @user.ratings.count } }
      else
        format.html { redirect_to user_path(@user.id), notice: 'Error!' }
        format.json { render nothing: true }
      end
    end
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def rating_params
    params.require(:rating).permit(:rate)
  end
end