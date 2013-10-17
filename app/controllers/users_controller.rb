class UsersController < ApplicationController

  def show
    @user = current_user
    @rating = @user.ratings.build
  end
end