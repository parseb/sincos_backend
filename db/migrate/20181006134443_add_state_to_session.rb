class AddStateToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :state, :string
  end
end
