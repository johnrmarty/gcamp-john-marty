class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


 helper_method :current_user, :check_for_admin_or_membership



  private
  
  def user_logged_in!
  	return if current_user.present?
  	flash[:notice] = "please sign in"
  	redirect_to root_path
  end 


  def sign_in(user)
  	session[:user_id] = user.id if user.present?
  end 

  def sign_out
  	session[:user_id] = nil
  end 

  def current_user
  	User.find_by id: session[:user_id] if session[:user_id]
  end 

  def current_user?
    current_user.present
  end 


  def check_for_admin_or_membership
      if !(@project.users.include?(current_user) || current_user.admin)
      redirect_to projects_path, notice: "You do not have access to that project"
      end
  end 


end

