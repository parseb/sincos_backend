class AddTypeToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :type, :string
    add_column :tasks, :link, :string
  end
end
