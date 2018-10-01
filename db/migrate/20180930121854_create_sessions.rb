class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :name
      t.datetime :time
      #t.participants :has_many
      t.text :transcript
      t.references :agenda
      
      t.timestamps
    end
  end
end
