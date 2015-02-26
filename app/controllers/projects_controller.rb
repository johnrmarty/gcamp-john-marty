class ProjectsController < ApplicationController

    before_action :user_logged_in!

   def index
     @projects = Project.all
   end

   def show
     @project = Project.find(params[:id])
   end

   def new
     @project = Project.new

   end

   def edit
     @project = Project.find(params[:id])
   end

   def create
     @project = Project.new(project_params)
      if @project.save

       redirect_to projects_path, notice: 'Project was successfully created'
     else
       render :new
     end
   end

   def update
     @project = Project.find(params[:id])
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

 end