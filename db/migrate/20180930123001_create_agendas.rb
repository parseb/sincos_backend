class CreateAgendas < ActiveRecord::Migration[5.2]
  def change
    create_table :agendas do |t|
      t.string :title
      t.belongs_to :session, foreign_key: true

      t.timestamps
    end
  end
end
