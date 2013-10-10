class WelcomeController < ApplicationController
	
	def index
    redirect_to businesses_path if current_user
	end
end