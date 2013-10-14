class WelcomeController < ApplicationController
	
	def index
    if user_signed_in?
      redirect_to businesses_path if current_user.role == "Merchant"
      redirect_to orders_path if current_user.role == "Courier"
    else
    end
	end
end