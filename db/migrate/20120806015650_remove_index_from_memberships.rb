class RemoveIndexFromMemberships < ActiveRecord::Migration
  def change
  	remove_index :memberships, [:pool_id, :user_id]
  end
end
