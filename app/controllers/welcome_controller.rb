class WelcomeController < ApplicationController
  def index
    @quotes = [["gCamp has changed my life! Its the best tool Ive ever used.", "Cayla Hayes"],["Before gCamp I was a disorderly slob. Now Im more organized than Ive ever been", "Leta Jaskolski"],["Dont hesitate - sign up right now! Youll never be the same.", "Lavern Upton"]]
  end

end
