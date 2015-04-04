class Rolefix < ActiveRecord::Migration
  def change
  	add_column :memberships, :role, :integer, default: 0
  	remove_column("memberships", "member")
  end
end
