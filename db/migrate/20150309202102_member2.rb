class Member2 < ActiveRecord::Migration
  def change
  	add_column("memberships", "user_id", :integer)
  	add_column("memberships", "project_id", :integer)
  end
end
