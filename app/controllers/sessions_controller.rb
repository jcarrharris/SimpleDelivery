class SessionsController < ApplicationController
	skip_before_filter :require_login, except: :destroy

	def new
		@user = User.new
	end

	def create
		if @user = login(params[:email], params[:password], params[:remember])
			redirect_to :root, notice: "Logged in!"
		else
			redirect_to :root, notice: "Invalid"
		end
	end

	def destroy
		logout
		redirect_to :root, notice: "See you later!"
	end

end