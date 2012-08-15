class AddDatetimeToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :datetime, :datetime
    remove_column :schedules, :date
    remove_column :schedules, :time
  end
end
