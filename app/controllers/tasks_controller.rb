class TasksController < ApplicationController

  belongs_to :project
  
   before_action :user_logged_in!


  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @submit = "Create task"
  end

  # GET /tasks/1/edit
  def edit
     @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
      if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new      
      end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.' 
      else
        render :edit 
      end
    end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.destroy(params[:id])
    @task.destroy
    redirect_to tasks_path, alert: 'Task was successfully destroyed.'
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
      params.require(:task).permit(:description, :due_date,)
    end
end 
