class AddDataToInsession < ActiveRecord::Migration[5.2]
  def change
    add_column :insessions, :data, :text
  end
end
