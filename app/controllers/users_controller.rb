class UsersController < ApplicationController
before_filter :get_user, :only => [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	auto_login(@user)
      redirect_to :root, :notice => "Signed up!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to :root, :notice => "Account deleted!"
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def get_user
    @user = User.find(params[:id])
  end
end