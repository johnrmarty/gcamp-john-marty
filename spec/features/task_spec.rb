	require 'rails_helper'


describe 'User can CRUD a task' do 
	

	before :each do 

	 User.create(email: 'q@q.com', password: 'q', first_name: 'john', last_name: 'marty')
		
		visit '/'
		click_on "Signin"
		fill_in 'email', :with => "q@q.com"
		fill_in 'password', :with => "q"
		click_on "Sign in"		
	
	
	end 


	 scenario 'Users can create a task' do

		click_on "Tasks"
		# click on link to go to new task form
		click_on "New Task"
		#filling out form for task
	   	
    	fill_in 'task[description]', with: "Example task"
	   	click_on "Create task"
		
		expect(page).to have_content("Task was successfully created.") 
		expect(page).to have_content("Example task") 

	end 




scenario 'Users can edit a task' do

	@task = Task.create(:description => "Example task", :due_date => "2015-01-30")
		visit "/tasks"
		click_on "Edit"
		fill_in 'task[description]', with: "Example task edit"
		click_on "Update Task"

		expect(page).to have_content("Task was successfully updated.")
		expect(page).to have_content("Example task edit")
	end


	

scenario 'Users can show a task' do

	@task = Task.create(:description => "Example task", :due_date => "2015-01-30")
		visit "/tasks"

		click_on "Example task"
		expect(page).to have_content("Example task")
		expect(page).to have_content("2015-01-30")

	end 



scenario 'Users can delete a task' do 

	@task = Task.create(:description => "Example task", :due_date => "2015-01-30")
		visit "/tasks"
		click_on "Destroy"
		expect(page).to have_content("Task was successfully destroyed.")

	end 

end 






