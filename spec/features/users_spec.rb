require 'rails_helper'


describe 'User can CRUD a user' do 
	

	 scenario 'Users can create a new user' do
	
		visit '/'

		click_on "Users"
		
		click_on "New User"
		
	   	
    	fill_in 'user[first_name]', with: "john"
    	fill_in 'user[last_name]', with: "marty"
    	fill_in 'user[email]', with: "john@gmail.com"
    	fill_in 'user[password]', with: "marty"
	   
	   	click_on "Create User"
		
		expect(page).to have_content("User was successfully created.") 
		

	end 




scenario 'Users can edit a user' do

	@user = User.create(:first_name => "john", :last_name => "marty", :email => "john@gmail.com", :password => "marty")
		
		visit '/'

		click_on "Users"

		click_on "Edit"

		fill_in 'user[first_name]', with: "johnny"
    	fill_in 'user[last_name]', with: "martyyy"
    	fill_in 'user[email]', with: "john@gmailll.com"

    	click_on "Update User"
		
		expect(page).to have_content("User was successfully updated") 



	end



scenario 'Users can delete a user' do

	@user = User.create(:first_name => "john", :last_name => "marty", :email => "john@gmail.com", :password => "marty")
		
		visit '/'

		click_on "Users"

		click_on "Edit"

    	click_on "delete"
		
		expect(page).to have_content("User was successfully deleted.") 	
	end 


end 







