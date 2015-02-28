require 'rails_helper'


describe 'User can sign out' do 
	

	before :each do 

	 User.create(email: 'q@q.com', password: 'q', first_name: 'john', last_name: 'marty')	
	
	
	end 


	 scenario 'Users can signout' do

	 	visit '/'
		click_on "Signin"
		fill_in 'Email', :with => "q@q.com"
		fill_in 'Password', :with => "q"
		click_on "Sign in"		
		click_on "Signout"	
		expect(page).to have_content("You are now signed out") 
		

	end 

end 