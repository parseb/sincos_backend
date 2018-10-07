class ChangeInviteToS < ActiveRecord::Migration[5.2]
  def change
    change_column :sessions, :invite, :string
  end
end
