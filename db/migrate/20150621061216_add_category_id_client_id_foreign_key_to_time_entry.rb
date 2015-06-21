class AddCategoryIdClientIdForeignKeyToTimeEntry < ActiveRecord::Migration
  def change
    add_foreign_key :time_entries, :categories
    add_foreign_key :time_entries, :clients
  end
end
