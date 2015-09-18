class AddProjectIdToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :project_id, :integer
  end
end
