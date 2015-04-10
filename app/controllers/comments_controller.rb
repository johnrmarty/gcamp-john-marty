class CommentsController < ApplicationController


  def create
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.task_id = params[:task_id]
    @comment.user_id = current_user.id

      if @comment.save 
        redirect_to project_task_path(@project, @task), notice: "Comment was saved successfully"
      else
        redirect_to project_task_path(@project, @task)
      end 
  end 

  private 
    def comment_params
      params.require(:comment).permit(:user_id, :task_id, :body, :created_at, :updated_at)
    end 
end 








