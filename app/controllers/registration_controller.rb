class RegistrationController < ApplicationController

	def new 
		@user = User.new
	end 

	def create
     @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
     	if User.save 
     		session[:user_id] = @user.user_id
     			redirect_to root_path, notice: 'You successfully signed in'
     		else
     	render :new 
     	end 
     end  
end 