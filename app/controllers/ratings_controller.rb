class RatingsController < ApplicationController
  before_filter :authenticate_user!, :get_user

  def create
    @rating = @user.ratings.build(rating_params)
    @rating.user_id = @user.id

    respond_to do |format|
      if @rating.save
        format.html { redirect_to :root, notice: 'Rating added!' }
        format.js
      else
        format.html { redirect_to user_path(@user.id), notice: 'Error!' }
        format.js
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