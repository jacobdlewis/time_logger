class AddActivityIdToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :activity_id, :integer
  end
end
