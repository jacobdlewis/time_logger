class RemoveClientIdandCategoryIdFromTimeEntry < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :time_entries do |t|
        dir.up   { t.remove :client_id, :category_id}
        dir.down { t.integer :client_id, :category_id}
      end
    end
  end
end
