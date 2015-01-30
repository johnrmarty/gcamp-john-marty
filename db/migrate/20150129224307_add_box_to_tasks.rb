class AddBoxToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :box, :boolean
  end
end
