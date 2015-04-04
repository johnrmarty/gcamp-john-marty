class MembershipsController < ApplicationController
	

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
   @membership = Membership.find(params[:id])
   if @membership.update(membership_params)
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.fullname} was successfully added"
  else
    render :edit 
  end
end

  def destroy
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.fullname} was successfully deleted"
  end 

  private
	def membership_params
     params.require(:membership).permit(:user_id, :project_id, :role)
   end

end 
    