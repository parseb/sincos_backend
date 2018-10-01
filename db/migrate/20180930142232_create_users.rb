class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :auth
      t.string :phone
      t.text :bio
      t.string :email

      t.timestamps
    end
  end
end
