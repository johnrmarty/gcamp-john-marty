require 'rails_helper'
require 'pry'

describe 'User can CRUD a project' do 

	before :each do 

	 # User.create!(email: 'q@q.com', password: 'q', first_name: 'john', last_name: 'marty')
   @user = User.create(email: 'admin@example.com', password: 'password', first_name: 'john', last_name: 'marty')
   @project = Project.create!(:name => "Example project") 
   Membership.create(user_id: @user.id, project_id: @project.id, role: "owner")
		
		visit '/'
		click_on "Sign In"
		fill_in 'email', :with => "admin@example.com"
		fill_in 'password', :with => "password"
		click_on "Sign in"
  end 


  it "goes to projects index" do
  expect(page).to have_content "You are signed in"

  end 
	  
  scenario 'Users can create a project' do

      
      find("#rspec-new").click
  	  fill_in 'project[name]', with: "Example project"
  	  click_on "Create Project"
  		expect(page).to have_content("Project was successfully created") 
		

	   end 

    scenario 'Users can edit a project' do
      Membership.create(project_id: @project.id, user_id: @user.id, role: 'owner')
      first(:link, 'Example project').click

      click_on "Edit"  
  		fill_in 'project[name]', with: "Example task edit 123"
  		click_on "Update Project"

		expect(page).to have_content("Project was successfully edited")
		
	end


	

scenario 'Users can show a project' do

		Membership.create(project_id: @project.id, user_id: @user.id, role: 'owner')

		first(:link, 'Example project').click

		expect(page).to have_content("Example project")


	end 



scenario 'Users can delete a project' do 

    Membership.create(project_id: @project.id, user_id: @user.id, role: 'owner')

    first(:link, 'Example project').click
		click_on "Delete"
		expect(page).to have_content("Project was successfully destroyed")

	end 

end 




