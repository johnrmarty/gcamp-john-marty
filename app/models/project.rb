class Project < ActiveRecord::Base

	has_many :tasks

	validates :name, presence: true, allow_blank: false 
end
