class AddJoincodeToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :auth, :string
    rename_column :sessions, :taks_id, :task_ids
  end
end
