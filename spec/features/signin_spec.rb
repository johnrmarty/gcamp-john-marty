require 'rails_helper'


describe 'User can sign-in' do 
	

	before :each do 

	 User.create(email: 'q@q.com', password: 'q', first_name: 'john', last_name: 'marty')	
	
	
	end 


	 scenario 'Users can sign-in with valid information' do

	 	visit '/'
		click_on "Sign In"
		fill_in 'Email', :with => "q@q.com"
		fill_in 'Password', :with => "q"
		click_on "Sign in"		

		expect(page).to have_content("You are signed in") 

	end 

	scenario 'Users can NOT sign-in with invalid information' do

	 	visit '/'
		click_on "Sign In"
		fill_in 'Email', :with => ""
		fill_in 'Password', :with => ""
		click_on "Sign in"		

		expect(page).to have_content("Invalid email or password") 




end 
end 