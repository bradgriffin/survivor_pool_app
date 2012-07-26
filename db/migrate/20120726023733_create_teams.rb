class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :location
      t.string :nickname
      t.string :division
      t.string :coach
      t.integer :wins_2011
      t.integer :losses_2011
      t.integer :wins_2012
      t.integer :losses_2012

      t.timestamps
    end
    add_index :teams, :location
    add_index :teams, :nickname, unique: true
  end
end
