class ProjectsController < ApplicationController

    before_action :user_logged_in!
    before_action :set_project, only: [:edit, :show, :update, :destroy]
    before_action :check_for_admin_or_membership, only: [:edit, :update, :destroy, :show]
    before_action :check_owner, only: [:edit, :update, :destroy]
    

   def index
     @projects = Project.all
     @memberships = Membership.all
   end

   def show
   end

   def new
     @project = Project.new

   end

   def edit
   end

   def create
     @project = Project.new(project_params)
      if @project.save
           if @project.memberships.create(user: current_user, role: :owner)
          redirect_to project_tasks_path(@project), notice: 'Project was successfully created'
        else
          render :new
        end
      end
    end  

   def update
     if @project.update(project_params)
       redirect_to projects_path(@project),  notice: 'Project was successfully edited'
     else
       render :edit
     end
   end

   def destroy
     @project = Project.destroy(params[:id])

     @project.destroy
     redirect_to projects_path, notice: 'Project was successfully destroyed'
   end

   private

   def project_params
     params.require(:project).permit(:name)
   end


   def set_project
    @project = Project.find(params[:id])
   end

   def check_owner
      unless current_user.admin?
        redirect_to projects_path, alert: 'You do not have access.' unless current_user.project_owner?(@project)
      end
    end

 end




