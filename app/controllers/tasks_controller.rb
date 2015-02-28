class TasksController < ApplicationController

  
   before_action :user_logged_in!


  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @project = Project.find(params[:project_id])
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @project = Project.find(params[:project_id])
     @task = Task.find(params[:id])
  end


  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project_id = @project.id
      if @task.save
      redirect_to project_tasks_path(@project, @task), notice: 'Task was successfully created.'
      else
        render :new      
      end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
     @project = Project.find(params[:project_id])
      @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to project_tasks_path(@project), notice: 'Task was successfully updated.' 
      else
        render :edit 
      end
    end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.destroy(params[:id])
    @task.destroy
    redirect_to project_tasks_path(@project), alert: 'Task was successfully destroyed.'
    end

  private
  def login_in
    !current_user = nil?
  end 

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :due_date, :box, :project_id)
    end
end 
