require 'rails_helper'


describe 'User can Register for gCamp' do 
	



	 scenario 'Users can signup for gCamp' do
	
		visit '/'
		click_on "Signup"
		fill_in 'First name', :with => "john"
		fill_in 'Last name', :with => "john"
		fill_in 'Email', :with => "j@j.com"
		fill_in 'Password', :with => "john"
		fill_in 'Password confirmation', :with => "john"
		click_on "Create User"	

		expect(page).to have_content("You successfully signed in") 
	

	end 


	 scenario 'Users can NOT signup for gCamp with empty fields' do
	
		visit '/'
		click_on "Signup"
		fill_in 'First name', :with => ""
		fill_in 'Last name', :with => ""
		fill_in 'Email', :with => ""
		fill_in 'Password', :with => ""
		fill_in 'Password confirmation', :with => ""
		click_on "Create User"	

		expect(page).to have_content("5 errors prohibited this user from being saved:") 


	end 

	scenario 'Users can NOT signup without a unique password' do

		User.create(email: 'q@q.com', password: 'q', first_name: 'john', last_name: 'marty')
	
		visit '/'
		click_on "Signup"
		fill_in 'First name', :with => "john"
		fill_in 'Last name', :with => "john"
		fill_in 'Email', :with => "q@q.com"
		fill_in 'Password', :with => "marty"
		fill_in 'Password confirmation', :with => "marty"
		click_on "Create User"	

		expect(page).to have_content("Email has already been taken") 



end 

end 


