class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :entry_id
      t.integer :user_id
      t.integer :schedule_id
      t.integer :selected_team_id

      t.timestamps
    end
  end
end
