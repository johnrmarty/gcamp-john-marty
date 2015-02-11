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
     
      respond_to do |format|
      if @user.save

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path, notice: 'User was successfully deleted.'
    end

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
  end
