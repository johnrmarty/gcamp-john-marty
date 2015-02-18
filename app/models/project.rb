class Project < ActiveRecord::Base

	validates :name, presence: true, allow_blank: false 
end
