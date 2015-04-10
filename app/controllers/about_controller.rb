class AboutController < ApplicationController
  def index
  	@memberships = Membership.all
  	@users = User.all
  	@tasks = Task.all
  	@projects = Project.all
  	@comments = Comment.all
  end
end
