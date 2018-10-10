class CreateSessionrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :sessionrecords do |t|
      t.string :joincode
      t.references :session
      t.string :userauth
      t.text :transcript

      t.timestamps
    end
  end
end
