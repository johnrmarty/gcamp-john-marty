class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :body
    	t.integer :user_id
    	t.integer :task_id
    	t.datetime :created_at
    	t.datetime :updated_at

    end
  end
end
