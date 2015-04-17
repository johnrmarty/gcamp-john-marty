require 'rails_helper'


describe 'Users have different permissions' do 
	

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

	 scenario 'new users are taken to new project page after signing up' do

	 	find("#rspec-new").click
  	  	fill_in 'project[name]', with: "Example project2"
  	  	click_on "Create Project"
  		expect(page).to have_content("Project was successfully created") 

	end 

	it 'user is added as an owner of a project it creates' do

		find("#rspec-new").click
  	  	fill_in 'project[name]', with: "Example project3"
  	  	click_on "Create Project"
  		expect(page).to have_content("Project was successfully created")
  		first(:link, 'Example project3').click
  		click_on '1 Member'
		expect(page).to have_content 'You are the last owner'

	end 

	it 'users can only see projects that they created on the projects index page' do 

		@project2 = Project.create(name: "a project that does not belong to me")
		visit project_path(@project2)
		expect(page).not_to have_content "a project that does not belong to me"

	end 

	it 'user is not allowed to view projects that he/she does not belong to' do 

		@project3 = Project.create(name: "a project that does not belong to me")
		visit project_memberships_path(@project3)
		expect(page).to have_content "You do not have access to that project"
	end 

	 it 'members can only see their own x button to remove a membership' do

	 	@user2 = User.create(email: 'john@example.com', password: 'john', first_name: 'john', last_name: 'marty')
	 	@project2 = Project.create!(:name => "Example project2") 
	 	Membership.create!(user_id: @user2.id, project_id: @project2.id, role: "member")
	 	
	 	click_on 'Sign Out'
	 	click_on 'Sign In'
		fill_in 'email', :with => "john@example.com"
		fill_in 'password', :with => "john"
		click_on "Sign in"
		expect(page).to have_content "You are signed in"
		first(:link, 'Example project2').click
		click_on "1 Member"
		find("#rspec-membership-delete").click
		expect(page).to have_content "john marty was successfully removed"





	end 

		





end 

