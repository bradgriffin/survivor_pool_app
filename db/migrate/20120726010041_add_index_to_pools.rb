class AddIndexToPools < ActiveRecord::Migration
  def change
  	add_index :pools, :name, unique: true
  end
end
