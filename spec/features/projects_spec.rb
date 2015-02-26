require 'rails_helper'


describe 'User can CRUD a project' do 

	before :each do 

	 User.create(email: 'q@q.com', password: 'q', first_name: 'john', last_name: 'marty')
		
		visit '/'
		click_on "Signin"
		fill_in 'email', :with => "q@q.com"
		fill_in 'password', :with => "q"
		click_on "Sign in"		
	
	
	end 
	

	 scenario 'Users can create a project' do

	
		
		click_on "Projects"

		click_on "New Project"
	   	
    	fill_in 'project[name]', with: "Example project"
	   	click_on "Create Project"
		
		expect(page).to have_content("Project was successfully created") 
		

	end 




scenario 'Users can edit a project' do

	@project = Project.create(:name => "Example project")
		
		visit '/'

		click_on "Projects"
		
		click_on "Edit"
		click_on "Edit"
		
		fill_in 'project[name]', with: "Example task edit 123"
		click_on "Update Project"

		expect(page).to have_content("Project was successfully edited")
		
	end


	

scenario 'Users can show a project' do


	@project = Project.create(:name => "Example task edit 123")
		
		visit '/'

		click_on "Projects"
		
		click_on "Example task edit 123"

		expect(page).to have_content("Example task edit 123")


	end 



scenario 'Users can delete a task' do 

	@task = Task.create(:description => "Example task", :due_date => "2015-01-30")
		visit "/tasks"

		click_on "Tasks"
		click_on "Destroy"
		expect(page).to have_content("Task was successfully destroyed.")

	end 

end 




