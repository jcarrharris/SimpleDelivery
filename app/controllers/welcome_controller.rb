class WelcomeController < ApplicationController
	
	def index
    redirect_to businesses_path if current_user.role == "Merchant"
    redirect_to orders_path if current_user.role == "Courier"
	end
end