class UsersController < ApplicationController

  def new
    @user = User.new
    @submit = "Create user"
  end

  def index
    @users = User.all
  end

  def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path, notice:'User was successfully created'
      end
    end

    def update
      @user = User.find(params[:id])
      @user.update_attributes(user_params)
      redirect_to events_path
    end



    def edit
      @user = User.find(params[:id])
    end

    def show
    end

    def destroy
    end

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
  end
