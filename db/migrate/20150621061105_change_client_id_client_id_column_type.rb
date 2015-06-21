class ChangeClientIdClientIdColumnType < ActiveRecord::Migration
  def change
    change_column :time_entries, :category_id, 'integer USING CAST(category_id AS integer)'
    change_column :time_entries, :client_id, 'integer USING CAST(category_id AS integer)'
  end
end
