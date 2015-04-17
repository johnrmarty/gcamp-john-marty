require 'rails_helper'


describe 'User can CRUD a task' do 
	

	before :each do 

	@user = User.create(email: 'admin@example.com', password: 'password', first_name: 'john', last_name: 'marty')
    @project = Project.create!(:name => "Example project") 
    Membership.create!(user_id: @user.id, project_id: @project.id, role: "owner")
    
		
		visit '/'
		click_on "Sign In"
		fill_in 'email', :with => "admin@example.com"
		fill_in 'password', :with => "password"
		click_on "Sign in"	
	
	
	end 


	 scenario 'Users can create a task' do

	 	first(:link, 'Example project').click

		click_on "0 Tasks"
		click_on "New Task"	   	
    	fill_in 'task[description]', with: "Example task"
	   	click_on "Create Task"
		
		expect(page).to have_content("Task was successfully created.") 
		expect(page).to have_content("Example task") 

	end 




scenario 'Users can edit a task' do

		@task = Task.create(project_id: @project.id, :description => "Example task", :due_date => "2015-01-30")

		first(:link, 'Example project').click
		click_on "1 Task"
		click_on "Edit"
		fill_in 'task[description]', with: "Example task edit"
		click_on "Update Task"

		expect(page).to have_content("Task was successfully updated.")
		expect(page).to have_content("Example task edit")
	end


	

scenario 'Users can show a task' do

		@task = Task.create(project_id: @project.id, :description => "Example task", :due_date => "2015-01-30")
		first(:link, 'Example project').click
		click_on "1 Task"
		expect(page).to have_content("Tasks for Example project")
		

	end 



scenario 'Users can delete a task' do 

		@task = Task.create(project_id: @project.id, :description => "Example task", :due_date => "2015-01-30")
		first(:link, 'Example project').click
		click_on "1 Task"
		find("#rspec-task-delete").click
		expect(page).to have_content("Task was successfully destroyed.")

	end 

end 







