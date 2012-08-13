class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :away_team_score
      t.integer :home_team_score
      t.integer :winning_team_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
