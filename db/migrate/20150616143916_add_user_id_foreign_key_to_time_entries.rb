class AddUserIdForeignKeyToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :user_id, :integer
    add_foreign_key :time_entries, :users
  end
end
