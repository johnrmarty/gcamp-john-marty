class AuthorizationController < ApplicationController

	def signin
	end

	def create
	    user = User.find_by_email(params[:email])
	    if user && user.authenticate(params[:password])
	      session[:user_id] = user.id
	      redirect_to root_path
	    else
	      @sign_in_error = "Username / password combination is invalid"
	      render :signin
	    end
	end




	  def destroy
	    session.clear
	    redirect_to root_path
	  end

end 
	
	
	

