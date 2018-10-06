class AddInitiatorToSession < ActiveRecord::Migration[5.2]
  def change
    #rename_column :sessions, :users_id, :user_id   ----task dependent sessions -> kill&reseed
  end
end
