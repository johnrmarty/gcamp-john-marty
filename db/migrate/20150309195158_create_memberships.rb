class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
     	t.boolean :member
    end
  end
end


