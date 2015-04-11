class UsersController < ApplicationController

  before_action :user_logged_in!

  def new
    @user = User.new
  
  end

  def index
    @users = User.all
  end

  def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "You are now a user!"
        sign_in @user
        redirect_to root_path, notice: 'User was successfully created.'
      else
        render :new
      end
  end



    def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated'
    else
      render :edit
    end
  end



    def edit
      @user = User.find(params[:id])
    end     

    

    def show
      @user = User.find(params[:id])
      @users = User.all
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path, notice: 'User was successfully deleted.'
    end

    def registration
      @user = User.new    
    end
    

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def assert_admin
      unless current_user
        render file: "public/404", layout: true, status: :not_found
      end
    end

    def team_members
    @team_members = current_user.projects.flat_map{|project| project.users}
    end

    def admin
    end 

end 
  
  
