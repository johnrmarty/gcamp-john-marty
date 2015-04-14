class MembershipsController < ApplicationController
	
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  before_action :check_for_admin_or_membership

	def new
    @membership = Membership.new
  end 



  def index 
		@project = Project.find(params[:project_id])
		@membership = @project.memberships.all
    @membership = Membership.new
	end 

	
  def create
    @membership = Membership.new(membership_params)
    @project = Project.find(params[:project_id])
    @membership.project_id = params[:project_id]
    @membership.project_id = @project.id
    if @membership.save
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.fullname} was successfully added"
    else
      render :index      
    end
  end

  def edit
  end 


   def update
   @project = Project.find(params[:project_id])
   if @membership.update(membership_params)
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.fullname} was successfully updated"
  else
    render :edit 
  end
end

  def destroy
    @project = Project.find(params[:project_id])
    @membership.destroy
    redirect_to projects_path, notice: "#{@membership.user.fullname} was successfully removed"
  end 

  private
	def membership_params
     params.require(:membership).permit(:user_id, :project_id, :role)
  end

  def set_membership
    @membership = Membership.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end


end 
    