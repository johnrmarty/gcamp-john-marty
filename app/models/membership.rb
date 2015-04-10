class Membership < ActiveRecord::Base

	def membership_count
		if membership.count == 1
			"#{membership.count} Membership"
		else
			"#{membership.count} Memberships"
		end 
	end 

belongs_to :user 
belongs_to :project

validates :user_id, presence: true
validates :user_id, uniqueness: {scope: :project_id, message: "was already added to this project."}

enum role: {member: 0, owner: 1}

	after_initialize :set_default_role, if: :new_record?

	def set_default_role
		role ||= :membership
	end


end 




