class AddInviteToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :invite, :text
  end
end
