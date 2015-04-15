class SessionsController < ApplicationController

	def new 
	end 

	def create 
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "You are signed in"
			redirect_to projects_path
		else
			flash.now[:notice] = "Invalid email or password"
			render 'new'

		end 
	end

	def destroy 
		sign_out
		flash[:notice] = "You are now signed out"
		redirect_to root_path
	end 


end 

