class ChangeTimeEntriesHoursWorkedToNumeric < ActiveRecord::Migration
  def change
    change_column :time_entries, :hours_worked, :numeric
  end
end
