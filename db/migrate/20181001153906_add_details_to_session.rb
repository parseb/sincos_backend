class AddDetailsToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :details, :text
  end
end
