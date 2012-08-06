class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :week
      t.date :date
      t.time :time
      t.integer :away_team_id
      t.integer :home_team_id

      t.timestamps
    end
  end
end
